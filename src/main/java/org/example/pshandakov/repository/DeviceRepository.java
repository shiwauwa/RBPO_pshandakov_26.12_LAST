package org.example.pshandakov.repository;

import org.example.pshandakov.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface DeviceRepository extends JpaRepository<Device, Long> {


    Device findByMacAddress(String macAddress);

    Optional<Device> findByMacAddressAndName(String macAddress, String deviceName);
    boolean existsByMacAddress(String macAddress);
}

