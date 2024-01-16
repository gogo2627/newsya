package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterDaoImpl implements RegisterDao{

    @Autowired
    private RegisterMapper rm;

    @Override
    public String DupChk(String id) {

        return rm.DupChk(id);

    }

    @Override
    public int regUser(UserDto udto) {
        int res = 0;

        try{
            res = rm.regUser(udto);
        }catch(Exception e){
            System.out.println("[User Insert Error]");
            e.printStackTrace();
        }

        return res;

    }


}
