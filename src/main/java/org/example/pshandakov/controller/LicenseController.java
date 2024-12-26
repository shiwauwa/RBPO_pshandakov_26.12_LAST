package org.example.pshandakov.controller;

import jakarta.annotation.security.RolesAllowed;
import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.License;
import org.example.pshandakov.service.impl.LicenseService;
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
@RequestMapping("/api/licenses")
public class LicenseController {

    private final LicenseService licenseService;

    @GetMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<List<License>> getAllLicenses() {
        return ResponseEntity.ok(licenseService.getAllLicenses());
    }

    @GetMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<License> getLicenseById(@PathVariable Long id) {
        Optional<License> license = licenseService.getLicenseById(id);
        return license
                .map(value -> ResponseEntity.ok().body(value))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<License> createLicense(@RequestBody License license) {
        var licenseCreated = licenseService.createLicense(license);
        return ResponseEntity.ok().body(licenseCreated);
    }

    @PutMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<License> updateLicense(@PathVariable Long id, @RequestBody License license) {
        license.setId(id);
        var updatedLicense = licenseService.updateLicense(license);

        return updatedLicense
                .map(value -> ResponseEntity.ok().body(value))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Void> deleteLicense(@PathVariable Long id) {
        licenseService.deleteLicense(id);
        return ResponseEntity.ok().build();
    }
}
