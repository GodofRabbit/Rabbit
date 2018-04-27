package com.tarena.util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;
public class DegistUtil {
	public static String md5Digest(String  origStr){
		try{
		MessageDigest md = 
			MessageDigest.getInstance("md5");
		//digest方法依据md5算法对一个字节数组进行
		//加密，然后返回一个加密之后的字节数组
		byte[] buff = md.digest(origStr.getBytes());
		
		//将buff字节数组再转换成一个字符串
		BASE64Encoder encoder = new BASE64Encoder();
		//encode方法会将字节数组转换成一个字符串
		String str = encoder.encode(buff);
		return str;
		}catch(NoSuchAlgorithmException a){
			a.printStackTrace();
			return null;
		}
	}
	
}
