package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;

public interface RegisterDao {

    public String DupChk(String id);

    public int regUser(UserDto udto);

}
