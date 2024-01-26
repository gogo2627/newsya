package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.RegisterMapper;
import com.mulcam.newsya.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper rm;

    @Override
    public String DupChk(String id) {

        rm.createUserTable();
        return rm.DupChk(id);

    }

    @Override
    public int regUser(UserDto udto) {
        int res = 0;

        try{
            rm.createUserTable();
            res = rm.regUser(udto);
        }catch(Exception e){
            System.out.println("[User Insert Error]");
            e.printStackTrace();
        }

        return res;

    }


}
