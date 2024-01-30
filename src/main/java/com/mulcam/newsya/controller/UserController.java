package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.dto.ModifyUserDto;
import com.mulcam.newsya.dto.NewsLikeDto;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.ArticleService;
import com.mulcam.newsya.service.LoginService;
import com.mulcam.newsya.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;
    @Autowired
    private ArticleService articleService;

    @Autowired
    private PasswordEncoder pwEncoder;

    @PostMapping("/ModifyProfile")
    @Transactional(rollbackFor = {Exception.class})
    @ResponseBody
    public String ModifyProfile(@RequestBody ModifyUserDto param, HttpSession session) {

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String loginId = (String)session.getAttribute("id");

        UserDto user = userService.findBy(loginId);
        LoginDto loginDto = new LoginDto();
        loginDto.setId(loginId);
        System.out.println(loginService.login(loginDto));

        if(!passwordEncoder.matches(param.getPassword(), loginService.login(loginDto))){
            return "MISSMATCHEDPWD";
        }else {
            user.setId(loginId);
//            user.setEmail(param.getEmail());
            user.setPhone(param.getPhoneNumber());
            user.setPassword(pwEncoder.encode(param.getNewPassword()));

            if (userService.update(user) == 1) {
                session.invalidate();
                return "SUCCESS";
            } else {
                return "FAIL";
            }
        }
    }

    @PostMapping("/Withdraw")
    @Transactional(rollbackFor = {Exception.class})
    @ResponseBody
    public String Withdraw(HttpSession session) {

        String loginId = (String)session.getAttribute("id");

        if (userService.delete(loginId) == 1) {
            session.invalidate();
            return "SUCCESS";
        } else {
            return "FAIL";
        }

    }

    @PostMapping("/toggleLike")
    @Transactional(rollbackFor = {Exception.class})
    @ResponseBody
    public String likeNews(@RequestParam(value = "newsId", required = false) String newsId, HttpSession session, Model model) {
        String loginId = (String)session.getAttribute("id");
        NewsLikeDto newsLikeDto = new NewsLikeDto();
        newsLikeDto.setLoginId(loginId);
        newsLikeDto.setNewsId(newsId);

        if (articleService.setLikedNews(newsLikeDto) == 1) {
            return "SUCCESS";
        } else {
            return "FAIL";
        }
    }

}
