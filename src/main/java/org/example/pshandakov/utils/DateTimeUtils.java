package org.example.pshandakov.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public final class DateTimeUtils {

    private DateTimeUtils() {

    }

    public static Date convertLocalDateToDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public static int calculateDaysBetween(Date expirationDate) {
        LocalDateTime currentDate = LocalDateTime.now();
        LocalDate expirationLocalDate = expirationDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate();
        return (int)ChronoUnit.DAYS.between(currentDate.toLocalDate(), expirationLocalDate);
    }

    public static Date parseFromString(String pattern, String date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.parse(date);
    }
}
