package com.kavisoft.web.abclaboratories.util;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Time;

import org.junit.jupiter.api.Test;

class AddMinutesUtilityTest {

	@Test
	void outputTimeMustEqualsToAdditionOfGievenTime() {
		
		AddMinutesUtility utility=AddMinutesUtility.getInstance();
		
		Time outputTime= utility.addMinutesToTime(Time.valueOf("09:00:00"), 10);
		
		assertEquals(Time.valueOf("09:10:00"), outputTime);
	}

}
