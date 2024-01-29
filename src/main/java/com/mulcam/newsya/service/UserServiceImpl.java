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
    public int update(UserDto user) {
        int res = 0;
        try{
            if(userMapper.updateUser(user) == 1){
                res = 1;
            }else{
                System.out.println("[User update Error]");
            }

        }catch(Exception e){
            System.out.println("[User update Error]");
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int delete(String loginId) {
        int res = 0;
        try{
            if(userMapper.deleteUser(loginId) == 1){
                if(userMapper.deleteCategory(loginId) == 1){
                    userMapper.deleteNewsLike(loginId);
                    res = 1;
                }else{
                    System.out.println("[Category Delete Error]");
                }
            }else{
                System.out.println("[User Delete Error]");
            }

        }catch(Exception e){
            System.out.println("[User Delete Error]");
            e.printStackTrace();
        }
        return res;
    }
}
