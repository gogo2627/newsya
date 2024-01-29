package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;

public interface UserService {
    public UserDto findBy(String loginId);

    public int update(UserDto user);

    public int delete(String loginId);

}
