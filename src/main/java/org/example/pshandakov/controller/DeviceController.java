package org.example.pshandakov.controller;

import jakarta.annotation.security.RolesAllowed;
import lombok.RequiredArgsConstructor;
import org.example.pshandakov.model.Device;
import org.example.pshandakov.service.impl.DeviceService;
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
@RequiredArgsConstructor
@RequestMapping("/api/devices")
public class DeviceController {

    private final DeviceService deviceService;

    @PostMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Device> createOrUpdateDevice(@RequestBody Device device) {
        Device savedDevice = deviceService.saveDevice(device);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedDevice);
    }


    @GetMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Device> getDeviceById(@PathVariable Long id) {
        Optional<Device> device = deviceService.getDeviceById(id);
        return device.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    @GetMapping
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<List<Device>> getAllDevices() {
        List<Device> devices = deviceService.getAllDevices();
        return ResponseEntity.ok(devices);
    }

    @DeleteMapping("/{id}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Void> deleteDevice(@PathVariable Long id) {
        Optional<Device> device = deviceService.getDeviceById(id);
        if (device.isPresent()) {
            deviceService.deleteDevice(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/mac/{macAddress}")
    @RolesAllowed("ROLE_ADMIN")
    public ResponseEntity<Device> getDeviceByMacAddress(@PathVariable String macAddress) {
        Device device = deviceService.getDeviceByMacAddress(macAddress);
        return device != null ? ResponseEntity.ok(device) : ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
}
