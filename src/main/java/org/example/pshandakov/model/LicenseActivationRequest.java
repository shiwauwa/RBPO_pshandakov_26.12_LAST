package org.example.pshandakov.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LicenseActivationRequest {

    private String code;
    private String macAddress;
    private String deviceName;

}
