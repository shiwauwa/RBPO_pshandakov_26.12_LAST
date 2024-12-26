package org.example.pshandakov.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.pshandakov.model.ApplicationUser;
import org.example.pshandakov.repository.ApplicationUserRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ApplicationUserService {

    private final ApplicationUserRepository userRepository;

    public List<ApplicationUser> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<ApplicationUser> getUserById(Long id) {
        return id == null ? Optional.empty() : userRepository.findById(id);
    }

    public Optional<ApplicationUser> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Optional<ApplicationUser> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void deleteUser(Long id) {
        if (id != null) {
            userRepository.deleteById(id);
        }
    }

    private ApplicationUser saveUser(ApplicationUser user) {
        return userRepository.save(user);
    }

    public ApplicationUser createUser(ApplicationUser user) {
        return this.saveUser(user);
    }

    public Optional<ApplicationUser> updateUser(ApplicationUser user) {
        if (user == null || user.getId() == null) {
            return Optional.empty();
        }

        var userToUpdate = this.getUserById(user.getId());

        if (userToUpdate.isPresent()) {
            if (user.getEmail() != null) {
                userToUpdate.get().setEmail(user.getEmail());
            }

            if (user.getUsername() != null) {
                userToUpdate.get().setUsername(user.getUsername());
            }

            if (user.getRole() != null) {
                userToUpdate.get().setRole(user.getRole());
            }

            if (!CollectionUtils.isEmpty(user.getLicenses())) {
                userToUpdate.get().setLicenses(user.getLicenses());
            }

            return Optional.of(this.saveUser(userToUpdate.get()));
        }

        return Optional.empty();
    }

}
