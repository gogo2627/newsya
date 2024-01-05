package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.UserDto;
import org.springframework.http.ResponseEntity;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public interface RegisterDao {

    public String DupChk(UserDto dto);

}
