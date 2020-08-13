package Fonctions;

import java.util.GregorianCalendar;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Check {
	
	
	private static CheckDay checkDay;
	private static CheckHour checkHour;
	
	private Check() {
		
	}
	
	public static void startCheck() {
		if (checkDay == null) {
			checkDay = new CheckDay();
			ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
			GregorianCalendar calendar = (GregorianCalendar) GregorianCalendar.getInstance();
			
			long start = (24-calendar.get(GregorianCalendar.HOUR));
			scheduler.scheduleAtFixedRate(checkDay, 0, 1, TimeUnit.MINUTES);
		}
		if (checkHour == null) {
			checkHour = new CheckHour();
			ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
			GregorianCalendar calendar = (GregorianCalendar) GregorianCalendar.getInstance();
			
			long start = (60-calendar.get(GregorianCalendar.MINUTE));
			scheduler.scheduleAtFixedRate(checkHour, 0, 1, TimeUnit.MINUTES);
		}
	}
}
