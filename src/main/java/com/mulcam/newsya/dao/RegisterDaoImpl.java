package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterDaoImpl implements RegisterDao{

    @Autowired
    private RegisterMapper rm;

    @Override
    public String DupChk(UserDto dto) {

        return rm.DupChk(dto);

    }
}
