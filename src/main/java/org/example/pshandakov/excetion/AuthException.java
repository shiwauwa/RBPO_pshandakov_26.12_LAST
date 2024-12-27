//TODO: опечатка в названии пакета
package org.example.pshandakov.excetion;

import org.springframework.security.core.AuthenticationException;

public class AuthException extends AuthenticationException {
    public AuthException(String msg) {
        super(msg);
    }
}
