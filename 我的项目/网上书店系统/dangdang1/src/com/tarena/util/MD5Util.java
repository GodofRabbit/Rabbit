package com.tarena.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	/**
	 *����MD5�㷨������һ��ժҪ
	 *ժҪ�㷨�������ص㣻
	 *1.Ψһ��
	 *2.�������ԣ��õ�֮���ܹ����Ƴ�ԭʼ������
	 * @throws NoSuchAlgorithmException 
	 * 
	 */
	public static String encrypt(String origStr) throws NoSuchAlgorithmException{
		MessageDigest md=MessageDigest.getInstance("md5");
		byte[] buff=md.digest(origStr.getBytes());
		BASE64Encoder encoder=new BASE64Encoder();//encode�ķ������Խ�byte����ַ���
		return encoder.encode(buff);
	}
	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(encrypt("I"));
		System.out.println(encrypt("I love  dssdsyou"));
	}
	

}
