package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RegisterMapper {

    @Select(" SELECT ID FROM USER WHERE ID = #{id} ")
    String DupChk(UserDto dto);

}
