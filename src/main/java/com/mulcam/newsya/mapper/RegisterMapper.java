package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RegisterMapper {

    @Select(" SELECT LOGIN_ID FROM USER WHERE LOGIN_ID = #{id} ")
    String DupChk(String id);

    @Insert(" INSERT INTO USER VALUES(NULL, #{id}, #{password}, #{name}, #{email}, #{phone}, NOW(), NOW()) ")
    int regUser(UserDto udto);

}

// org.apache.ibatis.reflection.ReflectionException: There is no getter for property named 'pw' 에러
// mapper에 Insert문에 들어가는 매개변수 이름과 dto 매개변수명과 달라서 발생한 문제이다.
