package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;

public interface UserService {
    public UserDto findBy(String loginId);

    public void update(UserDto user);

    public void delete(String loginId);

}
