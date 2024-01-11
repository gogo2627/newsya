package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.LoginDto;

import java.util.List;

public interface LoginDao {

    public String login(LoginDto dto);

    public String findId(LoginDto ldto);

}
