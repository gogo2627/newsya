package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;

public interface RegisterService {


    public String DupChk(String id);

    public int regUser(UserDto udto);

}
