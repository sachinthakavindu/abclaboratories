package com.kavisoft.web.abclaboratories.util;


import java.sql.Time;
import java.util.Calendar;

public class AddMinutesUtility {
    private static AddMinutesUtility instance;

    // Private constructor to prevent instantiation
    private AddMinutesUtility() {
    }

    // Method to get the singleton instance
    public static AddMinutesUtility getInstance() {
        if (instance == null) {
            instance = new AddMinutesUtility();
        }
        return instance;
    }

    // Method to add minutes to a given time
    public Time addMinutesToTime(Time time, int minutes) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);
        calendar.add(Calendar.MINUTE, minutes);

        return new Time(calendar.getTimeInMillis());
    }
}

