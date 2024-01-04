package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LoginDaoImpl implements LoginDao{

    @Autowired
    private LoginMapper lm;

    public List<LoginDto> login(LoginDto dto){

        return lm.login(dto);

    }

}
