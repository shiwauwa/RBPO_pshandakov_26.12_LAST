package org.example.pshandakov.excetion;

public class UserEmptyException extends Exception {

    public UserEmptyException() {
        super("User is empty");
    }
}
