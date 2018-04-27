package edu.sram.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

public class NoteUtil {
	
	public static String UUID(){
		UUID uuid = java.util.UUID.randomUUID();
		return uuid.toString();
	}

	public static String md5(String msg) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("md5");
		byte[] input = msg.getBytes();
		byte[] output = md.digest(input);
		
		String result = Base64.encodeBase64String(output);
		return result;
	}
	public static void main(String[] args) {
		String md5;
		try {
			md5 = NoteUtil.md5("1234");
			System.out.println(md5);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
	}
}
	
