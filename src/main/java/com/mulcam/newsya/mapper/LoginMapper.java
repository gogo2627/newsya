package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface LoginMapper {

    @Select(" SELECT PASSWORD FROM USER WHERE LOGIN_ID = #{id} ")
    String login(LoginDto ldto);

    @Select(" SELECT LOGIN_ID FROM USER WHERE NAME = #{name} AND PHONE_NUMBER = #{phone} ")
    String findId(LoginDto ldto);

    @Select(" SELECT COUNT(*) FROM USER WHERE NAME = #{name} AND PHONE_NUMBER = #{phone} AND LOGIN_ID = #{id} ")
    Boolean findPw(LoginDto ldto);

    @Update(" UPDATE USER SET PASSWORD = #{password} WHERE LOGIN_ID = #{id} AND PHONE_NUMBER = #{phone} ")
    int changePw(LoginDto ldto);

}
