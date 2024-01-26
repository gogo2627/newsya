package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.ModifyUserDto;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/ModifyProfile")
    @ResponseBody
    public String ModifyProfile(@RequestBody ModifyUserDto param, HttpSession session) {

        String loginId = (String)session.getAttribute("id");

        UserDto user = userService.findBy(loginId);

        if (!user.getPassword().equals(param.getPassword())) {
            throw new RuntimeException("현재 비밀번호가 일치하지 않습니다");
        }

        user.setId(loginId);
        user.setName(param.getName());
        user.setEmail(param.getEmail());
        user.setPhone(param.getPhoneNumber());
        user.setPassword(param.getNewPassword());

        userService.update(user);

        return "SUCCESS";
    }

    @PostMapping("/Withdraw")
    @ResponseBody
    public String Withdraw(HttpSession session) {

        String loginId = (String)session.getAttribute("id");
        userService.delete(loginId);

        session.invalidate();

        return "SUCCESS";
    }

}
