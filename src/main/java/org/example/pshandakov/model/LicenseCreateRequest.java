package org.example.pshandakov.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LicenseCreateRequest {

    private Long productId;
    private Long ownerId;
    private Long licenseTypeId;
    private String description;
    private Integer deviceCount;

}
