package com.tarena.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	/**
	 *依据MD5算法，生成一个摘要
	 *摘要算法有两个特点；
	 *1.唯一性
	 *2.不可逆性，得到之后不能够反推出原始的明文
	 * @throws NoSuchAlgorithmException 
	 * 
	 */
	public static String encrypt(String origStr) throws NoSuchAlgorithmException{
		MessageDigest md=MessageDigest.getInstance("md5");
		byte[] buff=md.digest(origStr.getBytes());
		BASE64Encoder encoder=new BASE64Encoder();//encode的方法可以将byte变成字符串
		return encoder.encode(buff);
	}
	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(encrypt("I"));
		System.out.println(encrypt("I love  dssdsyou"));
	}
	

}
