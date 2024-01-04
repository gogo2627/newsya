package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface LoginMapper {

    @Select(" SELECT ID, PW FROM USER WHERE ID = #{id} ")
    List<LoginDto> login(LoginDto dto);

}
