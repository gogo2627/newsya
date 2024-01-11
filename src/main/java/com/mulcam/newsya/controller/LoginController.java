package com.mulcam.newsya.controller;

import com.mulcam.newsya.dao.LoginDao;
import com.mulcam.newsya.dto.LoginDto;
import com.mulcam.newsya.dto.UserDto;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import static java.util.Objects.isNull;

@Controller
public class LoginController {

    @Autowired
    private LoginDao ldao;

    @RequestMapping("/goLogin")
    public String goLoginPage(@ModelAttribute("msg") String msg, Model model){
        model.addAttribute("msg", msg);
        return "login";
    }

    @RequestMapping("/goFindId")
    public String goFindIdPage(@ModelAttribute("msg") String msg, Model model){
        model.addAttribute("msg", msg);
        return "findid";
    }

    @RequestMapping("/goFindPw")
    public String goFindPwPage(@ModelAttribute("msg") String msg, Model model){
        model.addAttribute("msg", msg);
        return "findpw";
    }

    @PostMapping("/login")
    @Transactional(rollbackFor = {Exception.class})
    public String loginChk(RedirectAttributes redirect, HttpSession session, LoginDto ldto){

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        System.out.println(ldao.login(ldto));

        if(passwordEncoder.matches(ldto.getPassword(), ldao.login(ldto))){
            session.setAttribute("id", ldto.getId());
            session.setMaxInactiveInterval(0);
            return "redirect:/";
        }else{
            redirect.addFlashAttribute("msg", "아이디 또는 비밀번호를 다시 입력해주세요.");
            return "redirect:/goLogin";
        }

    }
    //https://jake-seo-dev.tistory.com/484

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/findingId")
    public String findingId(LoginDto ldto, RedirectAttributes redirect){

        if(!isNull(ldao.findId(ldto))){
            redirect.addFlashAttribute("id", ldao.findId(ldto));
            return "redirect:/goShowId";
        }else{
            redirect.addFlashAttribute("msg", "일치하는 아이디가 없습니다.");
            return "redirect:/goFindId";
        }

    }

    // isNull, isEmpty, isBlank 차이
    // https://velog.io/@jennyfromdeblock/isBlank-isEmpty-isNull-%EC%B0%A8%EC%9D%B4%EC%A0%90
    // https://onpups.pe.kr/337

}
