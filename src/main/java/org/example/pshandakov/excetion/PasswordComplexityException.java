package org.example.pshandakov.excetion;

public class PasswordComplexityException extends AuthException {
    public PasswordComplexityException(String msg) {
        super(msg);
    }
}
