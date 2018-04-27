package com.tarena.util;

import java.util.Random;

public class RandomString {
	private static char[] words=new char[]{'0','1','2','3','4','5','6','7','8','9','a',
		'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q',
		'r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J',
		'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
	public static String getString(){
		Random random=new Random();
		char[] newchar=new char[4];
		int length=words.length;
		for(int i=0;i<4;i++){
			newchar[i]=words[random.nextInt(length)];
		}
		return new String(newchar);
	}
	public static void main(String[] args) {
		System.out.println(getString());
	}

}
