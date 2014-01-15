package com.danai.app;

import java.util.Calendar;
import java.util.Date;

public class Functions {
	private Functions() {}

    public static int daysBetween(Date before, Date after) {
    	Calendar c1 = createCalendarWithoutTime(before);
        Calendar c2 = createCalendarWithoutTime(after);
        int days = 0;

        for (;c1.before(c2); days++) {
            c1.add(Calendar.DATE, 1);
        }

        return days;
    }
    
    public static int daysUntilToday(Date date) {
        return daysBetween(new Date(),date);
    }

    private static Calendar createCalendarWithoutTime(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar;
    }
}
