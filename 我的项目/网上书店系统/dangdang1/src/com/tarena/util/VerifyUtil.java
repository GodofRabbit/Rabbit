package com.tarena.util;

import java.util.UUID;

public class VerifyUtil {
	public static String createUUID(){
		UUID uuid=UUID.randomUUID();
		System.out.println("lijing +"+uuid);
		return uuid.toString();
	}

}
