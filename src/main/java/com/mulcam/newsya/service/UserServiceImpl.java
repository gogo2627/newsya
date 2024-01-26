package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;


    @Override
    public UserDto findBy(String loginId) {
        return userMapper.selectUser(loginId);
    }

    @Override
    public void update(UserDto user) {
        userMapper.updateUser(user);
    }

    @Override
    public void delete(String loginId) {
        userMapper.deleteUser(loginId);
    }
}
