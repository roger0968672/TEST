package com.petpet.member.util;

public class TestAES {

	public static void main(String[] args) {
		String pwd = "abc123com";
		String cipherText = AESUtil.encryptString(pwd);
		System.out.println(cipherText);
		String plainText = AESUtil.decryptString("KittySnoopyMicky", cipherText);
		System.out.println(plainText);

	}

}
