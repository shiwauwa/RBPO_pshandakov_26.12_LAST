package org.example.pshandakov.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.pshandakov.configuration.JwtTokenProvider;
import org.example.pshandakov.excetion.AuthException;
import org.example.pshandakov.excetion.PasswordComplexityException;
import org.example.pshandakov.excetion.RegException;
import org.example.pshandakov.model.ActionAuthRegHistory;
import org.example.pshandakov.model.ActionAuthRegHistoryTypes;
import org.example.pshandakov.model.ApplicationRole;
import org.example.pshandakov.model.ApplicationUser;
import org.example.pshandakov.model.AuthenticationRequest;
import org.example.pshandakov.model.AuthenticationResponse;
import org.example.pshandakov.model.RegistrationRequest;
import org.example.pshandakov.model.RegistrationResponse;
import org.example.pshandakov.repository.ActionAuthRegHistoryRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthenticationService {

    private final ActionAuthRegHistoryRepository actionAuthRegHistoryRepository;

    private final ApplicationUserService applicationUserService;
    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider jwtTokenProvider;

    private final PasswordEncoder passwordEncoder;

    @Value("${spring.application.min-password-length:6}")
    private int minPasswordLength;

    private void logFailedLogin(String email, String reason) {
        ActionAuthRegHistory historyEntry = ActionAuthRegHistory.builder()
                .email(email)
                .timeAction(LocalDateTime.now())
                .actionType(ActionAuthRegHistoryTypes.AUTH.getType())
                .description(String.format("Неудачная попытка входа: email=%s , причина=%s", email, reason))
                .build();
        actionAuthRegHistoryRepository.save(historyEntry);
        log.warn("Неудачная попытка входа: email={}, reason={}", email, reason);
    }

    private void logRegistrationAttempt(String email, String username, String description) {
        ActionAuthRegHistory historyEntry = ActionAuthRegHistory.builder()
                .email(email)
                .username(username)
                .timeAction(LocalDateTime.now())
                .description(description)
                .actionType(ActionAuthRegHistoryTypes.REG.getType())
                .build();
        actionAuthRegHistoryRepository.save(historyEntry);
        log.warn("Попытка регистрации: email={}, description={}", email, description);
    }


    public void checkPasswordComplexity(String password) throws PasswordComplexityException {
        if (password.length() < minPasswordLength) {
            throw new PasswordComplexityException(String.format("Ошибка регистрации: Пароль слишком короткий. Требуется не менее %s символов", minPasswordLength));
        }

        boolean hasUpperCase = !password.equals(password.toLowerCase());
        boolean hasLowerCase = !password.equals(password.toUpperCase());

        if (!hasUpperCase && !hasLowerCase) {
            throw new PasswordComplexityException("Ошибка регистрации: Слабый пароль, используйте символы разных регистров.");
        }

        boolean hasDigit = password.matches(".*\\d.*");
        boolean hasSpecialChar = password.matches(".*[!@#\\$%\\^&\\*].*");

        if (!hasDigit && !hasSpecialChar) {
            throw new PasswordComplexityException("Ошибка регистрации: Слабый пароль, используйте цифры или специальные символы (!@#$%^&*)");
        }
    }


    public AuthenticationResponse login(AuthenticationRequest request) throws AuthenticationException {
        String email = request.getEmail();
        String password = request.getPassword();

        try {
            if (!StringUtils.hasText(email)) {
                throw new AuthException("Поле email не должно быть пустым.");
            }
            if (!StringUtils.hasText(password)) {
                throw new AuthException("Поле password не должно быть пустым.");
            }

            ApplicationUser user = applicationUserService.getUserByEmail(email)
                    .orElseThrow(() -> new UsernameNotFoundException("Пользователь с таким email не найден."));

            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));
            AuthenticationResponse response = AuthenticationResponse.builder()
                    .token(jwtTokenProvider.createToken(email, user.getRole().getGrantedAuthorities()))
                    .email(email)
                    .message(String.format("Добро пожаловать, %s!", user.getUsername()))
                    .build();

            ActionAuthRegHistory historyEntry = ActionAuthRegHistory.builder()
                    .email(email)
                    .username(user.getUsername())
                    .timeAction(LocalDateTime.now())
                    .description("Успешный вход")
                    .actionType(ActionAuthRegHistoryTypes.AUTH.getType())
                    .build();
            actionAuthRegHistoryRepository.save(historyEntry);

            return response;
        } catch (UsernameNotFoundException ex) {
            logFailedLogin(request.getEmail(), "Пользователь с таким email не найден.");
            log.error("Пользователь с таким email: {} не найден.", request.getEmail());
            throw ex;
        } catch (BadCredentialsException ex) {
            logFailedLogin(request.getEmail(), "Неверный пароль.");
            log.error("Неверный пароль, email: {}", request.getEmail());
            throw ex;
        } catch (AuthenticationException ex) {
            logFailedLogin(request.getEmail() != null ? request.getEmail() : "", "Ошибка аутентификации: " + ex.getMessage());
            log.error("Ошибка аутентификации: {}", ex.getMessage());
            throw ex;
        }
    }

    public RegistrationResponse registerUser(RegistrationRequest request) throws RegException {
        try {
            if (applicationUserService.getUserByEmail(request.getEmail()).isPresent()) {
                final String msg = "Ошибка регистрации: Email уже используется";
                logRegistrationAttempt(request.getEmail(), null, msg);
                throw new RegException(msg);
            }
            if (applicationUserService.getUserByUsername(request.getUsername()).isPresent()) {
                final String msg = "Ошибка регистрации: Username уже используется";
                logRegistrationAttempt(request.getEmail(), request.getUsername(), msg);
                throw new RegException(msg);
            }

            checkPasswordComplexity(request.getPassword());
            ApplicationUser newUser = ApplicationUser.builder()
                    .username(request.getUsername())
                    .email(request.getEmail())
                    .password(passwordEncoder.encode(request.getPassword()))
                    .role(ApplicationRole.USER)
                    .build();

            newUser = applicationUserService.createUser(newUser);
            logRegistrationAttempt(newUser.getEmail(), newUser.getUsername(), "Успешная регистрация");
            log.info("Пользователь {} успешно зарегистрировался.", request.getUsername());
            return RegistrationResponse.builder().message("Успешная регистрация").build();
        } catch (Exception ex) {
            logRegistrationAttempt(request.getEmail(), request.getUsername(), "Ошибка регистрации: " + ex.getMessage());
            log.error("Ошибка при регистрации пользователя: {}", ex.getMessage());
            throw ex;
        }
    }
}
