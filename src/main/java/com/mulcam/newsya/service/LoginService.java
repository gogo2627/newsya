package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.LoginDto;

public interface LoginService {

    public String login(LoginDto dto);

    public String findId(LoginDto ldto);

    public Boolean findPw(LoginDto ldto);

    public int changePw(LoginDto ldto);

}
