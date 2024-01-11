package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface LoginMapper {

    @Select(" SELECT LOGIN_ID, PASSWORD FROM USER WHERE LOGIN_ID = #{id} ")
    List<LoginDto> login(LoginDto dto);

}
