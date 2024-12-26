package org.example.pshandakov.controller;

import jakarta.annotation.security.RolesAllowed;
import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.ApplicationUser;
import org.example.pshandakov.repository.ApplicationUserRepository;
import org.example.pshandakov.service.impl.ApplicationUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/users")
public class ApplicationUserController {

    private final ApplicationUserService applicationUserService;

    @GetMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<List<ApplicationUser>> getAllUsers() {
        return ResponseEntity.ok(applicationUserService.getAllUsers());
    }


    @GetMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<ApplicationUser> getUserById(@PathVariable Long id) {
        if (id == null) {
            return ResponseEntity.badRequest().build();
        }
        Optional<ApplicationUser> user = applicationUserService.getUserById(id);
        return user.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }


    @PostMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<ApplicationUser> createUser(@RequestBody ApplicationUser user) {
        if (user == null || user.getEmail() == null || user.getUsername() == null) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(applicationUserService.createUser(user));
    }


    @PutMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<ApplicationUser> updateUser(@PathVariable Long id, @RequestBody ApplicationUser user) {
        if (id == null || user == null) {
            return ResponseEntity.badRequest().build();
        }

        user.setId(id);
        var userUpdated = applicationUserService.updateUser(user);
        return userUpdated.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }


    @DeleteMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        if (id == null) {
            return ResponseEntity.badRequest().build();
        }
        applicationUserService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
}

