package com.tarena.util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;
public class DegistUtil {
	public static String md5Digest(String  origStr){
		try{
		MessageDigest md = 
			MessageDigest.getInstance("md5");
		//digest��������md5�㷨��һ���ֽ��������
		//���ܣ�Ȼ�󷵻�һ������֮����ֽ�����
		byte[] buff = md.digest(origStr.getBytes());
		
		//��buff�ֽ�������ת����һ���ַ���
		BASE64Encoder encoder = new BASE64Encoder();
		//encode�����Ὣ�ֽ�����ת����һ���ַ���
		String str = encoder.encode(buff);
		return str;
		}catch(NoSuchAlgorithmException a){
			a.printStackTrace();
			return null;
		}
	}
	
}
