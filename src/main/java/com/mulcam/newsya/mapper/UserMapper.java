package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserDto selectUser(String loginId);

    int updateUser(UserDto user);
    int deleteUser(String loginId);
    int deleteCategory(String loginId);
    int deleteNewsLike(String loginId);

}
