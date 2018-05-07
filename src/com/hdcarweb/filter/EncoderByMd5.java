package com.hdcarweb.filter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;
public class EncoderByMd5 {
	public static String md5(String str) throws NoSuchAlgorithmException {
		MessageDigest mdDigest = MessageDigest.getInstance("md5");
		byte[] buf = mdDigest.digest(str.getBytes());
		BASE64Encoder encoder = new BASE64Encoder();
		String str2 = encoder.encode(buf);
		System.out.println(str2);
		return str2;
	}
}
