package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper lm;

    @Override
    public String login(LoginDto dto){

        return lm.login(dto);

    }

    @Override
    public String findId(LoginDto ldto) {

        return lm.findId(ldto);

    }

    @Override
    public Boolean findPw(LoginDto ldto) {

        return lm.findPw(ldto);

    }

    public int changePw(LoginDto ldto){

        int res = 0;
        System.out.println("dao 진입 " + res);

        try{
            res = lm.changePw(ldto);
        }catch(Exception e){
            System.out.println("[PassWord Update Error]");
            e.printStackTrace();
        }

        System.out.println("dao res : " + res);
        return res;

    }

}
