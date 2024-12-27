package org.example.pshandakov.controller;

import jakarta.annotation.security.RolesAllowed;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.pshandakov.configuration.JwtTokenProvider;
import org.example.pshandakov.excetion.LicenseException;
import org.example.pshandakov.model.ApplicationUser;
import org.example.pshandakov.model.LicenseActivationRequest;
import org.example.pshandakov.model.LicenseCheckRequest;
import org.example.pshandakov.model.LicenseCreateRequest;
import org.example.pshandakov.model.LicenseUpdateRequest;
import org.example.pshandakov.repository.ApplicationUserRepository;
import org.example.pshandakov.service.impl.LicensingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.util.Optional;

//TODO: 1. updateLicense - клиент должен сам инициировать запрос на продление

@RestController
@RequestMapping("/licensing")
@RequiredArgsConstructor
@Slf4j
public class LicensingController {

    private final JwtTokenProvider jwtTokenProvider;
    private final ApplicationUserRepository applicationUserRepository;
    private final LicensingService licensingService;


    @PostMapping("/create")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<?> createLicense(HttpServletRequest request, @RequestBody LicenseCreateRequest requestData) {
        String email = jwtTokenProvider.getEmailFromRequest(request);
        Optional<ApplicationUser> userOptional = applicationUserRepository.findByEmail(email);

        try {
            var result = licensingService.createLicense(userOptional.orElse(null), requestData);
            return ResponseEntity.status(HttpStatus.CREATED).body(result);
        } catch (LicenseException e) {
            return ResponseEntity.status(e.getHttpStatus()).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Произошла ошибка при создании лицензии");
        }
    }

    @PostMapping("/update")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<?> updateLicense(HttpServletRequest request, @RequestBody LicenseUpdateRequest requestData) {
        String email = jwtTokenProvider.getEmailFromRequest(request);
        Optional<ApplicationUser> userOptional = applicationUserRepository.findByEmail(email);

        try {
            var result = licensingService.updateLicense(userOptional.orElse(null), requestData);
            return ResponseEntity.ok().body(result);
        } catch (ParseException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Неверный формат даты.");
        } catch (LicenseException e) {
            return ResponseEntity.status(e.getHttpStatus()).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Ошибка при продлении лицензии.");
        }
    }

    @PostMapping("/check")
    @RolesAllowed({"ROLE_USER", "ROLE_ADMIN"})
    public ResponseEntity<?> checkLicense(HttpServletRequest request, @RequestBody LicenseCheckRequest requestData) {
        String email = jwtTokenProvider.getEmailFromRequest(request);
        Optional<ApplicationUser> userOptional = applicationUserRepository.findByEmail(email);

        try {
            var result = licensingService.checkLicense(userOptional.orElse(null), requestData);
            return ResponseEntity.ok().body(result);
        } catch (LicenseException e) {
            return ResponseEntity.status(e.getHttpStatus()).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Произошла ошибка при проверке лицензии.");
        }
    }


    @PostMapping("/activation")
    @RolesAllowed({"ROLE_USER", "ROLE_ADMIN"})
    public ResponseEntity<?> activateLicense(HttpServletRequest request, @RequestBody LicenseActivationRequest activationRequest) {
        String email = jwtTokenProvider.getEmailFromRequest(request);
        Optional<ApplicationUser> userOptional = applicationUserRepository.findByEmail(email);

        try {
            var result = licensingService.activateLicense(userOptional.orElse(null), activationRequest);
            return ResponseEntity.ok().body(result);
        } catch (LicenseException e) {
            return ResponseEntity.status(e.getHttpStatus()).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Произошла ошибка при активации");
        }
    }
}
