package org.example.pshandakov.repository;

import org.example.pshandakov.model.LicenseType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LicenseTypeRepository extends JpaRepository<LicenseType, Long> {

}
