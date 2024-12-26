package org.example.pshandakov.excetion;

import lombok.Getter;
import org.springframework.http.HttpStatus;

public class LicenseException extends Exception {

    @Getter
    private final boolean createTicket;

    @Getter
    private final HttpStatus httpStatus;


    public LicenseException(String message, boolean createTicket, HttpStatus httpStatus) {
        super(message);
        this.createTicket = createTicket;
        this.httpStatus = httpStatus;
    }


    public LicenseException(String message, boolean createTicket) {
        this(message, createTicket, HttpStatus.BAD_REQUEST);
    }

    public LicenseException(String msg) {
        this(msg, false);
    }
}
