package com.mulcam.newsya.dao;

import com.mulcam.newsya.common.Sms;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.RegisterMapper;
import net.nurigo.sdk.message.model.Message;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

@Service
public class RegisterDaoImpl implements RegisterDao{

    @Autowired
    private RegisterMapper rm;

    @Override
    public String DupChk(String id) {

        System.out.println("Mapper 결과 : " + rm.DupChk((id)));
        return rm.DupChk(id);

    }

    @Override
    public int regUser(UserDto udto) {
        return rm.regUser(udto);
    }


}
