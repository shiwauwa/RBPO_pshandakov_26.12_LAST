package org.example.pshandakov.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AuthenticationResponse {

    private String email;
    private String token;
    private String message;

}
