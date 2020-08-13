package converter;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import Model.Reservation;

public class StringToSqlObject {
	Reservation reservation;

	public StringToSqlObject(Reservation reservation) {
		this.reservation = reservation;
	}

	public Date getDateDebut() {
		String datedebut = reservation.getDateDebut();
		Date date =new Date(getDate(datedebut));
		System.out.println(date.toString());
		return date ;
	}
	
	public Date getDatefin() {
		String datefin = reservation.getDatefin();
		Date date =new Date(getDate(datefin));
		System.out.println(date.toString());
		return date ;
	}
	
	public Time getHeureDebut() {
		String heuredebut = reservation.getHeureDebut();
		Time time = new Time(getHeure(heuredebut));
		System.out.println(time.toString());
		return time ;
	}
	
	public Time getHeureFin() {
		String heurefin = reservation.getHeureFin();
		Time time = new Time(getHeure(heurefin));
		System.out.println(time.toString());
		return time ;
	}
	
	private long getHeure(String heure) {
		DateFormat df = new SimpleDateFormat("hh:mm:ss");
		java.util.Date date = null;
		try {
			date = df.parse(heure);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time = date.getTime();
		return time;  
	}
	
	private long getDate(String calender) {
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date day = null;
		try {
			day = df.parse(calender);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long date = day.getTime();
		return date;
	}
}
