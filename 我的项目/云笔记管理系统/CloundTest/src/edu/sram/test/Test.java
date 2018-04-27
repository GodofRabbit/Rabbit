package edu.sram.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws ParseException {
		 Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyÄêMMÔÂddÈÕ");  
			Calendar c = Calendar.getInstance();  
			c.setTime(date); 
			c.add(Calendar.DATE,10);  

			System.out.println(sdf.format(c.getTime())); 
	}
	
}
