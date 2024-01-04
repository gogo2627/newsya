package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.UserDto;

public interface RegisterDao {

    public String DupChk(UserDto dto);

}
