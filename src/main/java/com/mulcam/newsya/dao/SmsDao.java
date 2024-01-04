package com.mulcam.newsya.dao;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public interface SmsDao {

    public int rnd();

    public String makeSignature() throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException;

}
