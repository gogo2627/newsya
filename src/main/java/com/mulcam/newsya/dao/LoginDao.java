package com.mulcam.newsya.dao;

import com.mulcam.newsya.dto.LoginDto;

import java.util.List;

public interface LoginDao {

    public List<LoginDto> login(LoginDto dto);

}
