package org.example.pshandakov.controller;

import jakarta.annotation.security.RolesAllowed;
import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.LicenseType;
import org.example.pshandakov.service.impl.LicenseTypeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/license-types")
@RequiredArgsConstructor
public class LicenseTypeController {

    private final LicenseTypeService licenseTypeService;

    @PostMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<LicenseType> createOrUpdateLicenseType(@RequestBody LicenseType licenseType) {
        LicenseType savedLicenseType = licenseTypeService.saveLicenseType(licenseType);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedLicenseType);
    }


    @GetMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<LicenseType> getLicenseTypeById(@PathVariable Long id) {
        Optional<LicenseType> licenseType = licenseTypeService.getLicenseTypeById(id);
        return licenseType.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }


    @GetMapping
    public ResponseEntity<List<LicenseType>> getAllLicenseTypes() {
        List<LicenseType> licenseTypes = licenseTypeService.getAllLicenseTypes();
        return ResponseEntity.ok(licenseTypes);
    }


    @DeleteMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Void> deleteLicenseType(@PathVariable Long id) {
        Optional<LicenseType> licenseType = licenseTypeService.getLicenseTypeById(id);
        if (licenseType.isPresent()) {
            licenseTypeService.deleteLicenseType(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
}
