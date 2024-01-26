package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserDto selectUser(String loginId);

    void updateUser(UserDto user);

    void deleteUser(String loginId);
}
