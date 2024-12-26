package org.example.pshandakov.service.impl;

import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.LicenseHistory;
import org.example.pshandakov.repository.LicenseHistoryRepository;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
@RequiredArgsConstructor
public class LicenseHistoryService {

    private final LicenseHistoryRepository licenseHistoryRepository;


    public void recordLicenseChange(Long licenseId, Long userId, String status, Date changeDate, String description) {
        LicenseHistory history = new LicenseHistory();
        history.setLicenseId(licenseId);
        history.setUserId(userId);
        history.setStatus(status);
        history.setChangeDate(changeDate);
        history.setDescription(description);
        licenseHistoryRepository.save(history);
    }
}
