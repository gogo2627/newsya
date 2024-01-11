package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface LoginMapper {

    @Select(" SELECT PASSWORD FROM USER WHERE LOGIN_ID = #{id} ")
    String login(LoginDto dto);

    @Select(" SELECT LOGIN_ID FROM USER WHERE NAME = #{name} AND PHONE_NUMBER = #{phone} ")
    String findId(LoginDto dto);

}
