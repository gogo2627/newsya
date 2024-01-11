package com.mulcam.newsya.controller;

import com.mulcam.newsya.dao.LoginDao;
import com.mulcam.newsya.dto.LoginDto;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private LoginDao dao;

    @RequestMapping("/goLogin")
    public String goLoginPage(@ModelAttribute("msg") String msg, Model model){
        model.addAttribute("msg", msg);
        return "login";
    }

    @PostMapping("/login")
    @Transactional(rollbackFor = {Exception.class})
    public String loginChk(RedirectAttributes redirect, HttpSession session, LoginDto dto){

        String attrVal = "아이디 또는 비밀번호를 다시 입력해주세요.";

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        List<LoginDto> list = dao.login(dto);

        if(list.size() == 0){
            redirect.addFlashAttribute("msg", attrVal);
            return "redirect:/goLogin";
        }else{
            if(!passwordEncoder.matches(dto.getPw(), list.get(1).toString())){
                redirect.addFlashAttribute("msg", attrVal);
                return "redirect:/goLogin";
            }else{
                session.setAttribute("id", dto.getId());
                session.setMaxInactiveInterval(0);
                return "redirect:/";
            }
        }
    }
    //https://jake-seo-dev.tistory.com/484

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
