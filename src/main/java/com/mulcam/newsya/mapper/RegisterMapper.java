package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RegisterMapper {

    @Select(" SELECT LOGIN_ID FROM USER WHERE LOGIN_ID = #{id} ")
    String DupChk(String id);

    @Insert(" INSERT INTO USER VALUES(NULL, #{id}, #{pw}, #{name}, #{email}, #{phone}, #{createdAt}, #{updatedAt}) ")
    String regUser(UserDto udto);

}
