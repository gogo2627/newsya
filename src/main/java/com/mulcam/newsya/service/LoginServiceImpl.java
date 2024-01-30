package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.mapper.LoginMapper;
import com.mulcam.newsya.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper lm;

    @Autowired
    private RegisterMapper rm;

    @Autowired
    private PasswordEncoder pwEncoder;

    @Override
    public String login(LoginDto dto){

        rm.createUserTable();
        return lm.login(dto);

    }

    @Override
    public String findId(LoginDto ldto) {

        rm.createUserTable();
        return lm.findId(ldto);

    }

    @Override
    public Boolean findPw(LoginDto ldto) {

        rm.createUserTable();
        return lm.findPw(ldto);

    }

    public int changePw(LoginDto ldto){

        int res = 0;
        System.out.println("dao 진입 " + res);

        try{
            rm.createUserTable();
            ldto.setPassword(pwEncoder.encode(ldto.getPassword()));
            res = lm.changePw(ldto);
        }catch(Exception e){
            System.out.println("[PassWord Update Error]");
            e.printStackTrace();
        }

        System.out.println("dao res : " + res);
        return res;

    }

}
