package org.example.pshandakov.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ActionAuthRegHistoryTypes {

    AUTH("Авторизация"),
    REG("Регистрация"),
    LICENSE("Лицензия");

    private final String type;

}
