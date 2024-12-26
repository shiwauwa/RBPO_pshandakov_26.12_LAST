package org.example.pshandakov.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.pshandakov.model.License;
import org.example.pshandakov.repository.LicenseRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class LicenseService {

    private final LicenseRepository licenseRepository;

    @GetMapping
    public List<License> getAllLicenses() {
        return licenseRepository.findAll();
    }

    public Optional<License> getLicenseById(Long id) {
        return id == null ? Optional.empty() : licenseRepository.findById(id);
    }

    public Optional<License> getLicenseByCode(String code) {
        return licenseRepository.findByCode(code);
    }

    public License createLicense(License license) {
        return licenseRepository.save(license);
    }

    public Optional<License> updateLicense(License license) {
        if (license == null || license.getId() == null) {
            return Optional.empty();
        }

        return Optional.of(licenseRepository.save(license));
    }

    public void deleteLicense(Long id) {
        licenseRepository.deleteById(id);
    }
}
