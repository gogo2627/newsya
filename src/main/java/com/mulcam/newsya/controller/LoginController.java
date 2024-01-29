package com.mulcam.newsya.controller;

import com.mulcam.newsya.service.LoginService;
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

import java.util.HashMap;
import java.util.Map;

import static java.util.Objects.isNull;

@Controller
public class LoginController {

    @Autowired
    private LoginService ldao;

    @Autowired
    private PasswordEncoder pwEncoder;

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

    @RequestMapping("/goShowId")
    public String goShowIdPage(@ModelAttribute("id") String id, RedirectAttributes redirect){

        System.out.println(id);
        redirect.addFlashAttribute("id", id);

        return "showid";
    }

    @RequestMapping("/goFindPw")
    public String goFindPwPage(@ModelAttribute("msg") String msg, Model model){
        model.addAttribute("msg", msg);
        return "findpw";
    }

    @RequestMapping("/goMyPage")
    public String goMyPage(){
        return "mypage"; 
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
    @Transactional(rollbackFor = {Exception.class})
    public String findingId(LoginDto ldto, RedirectAttributes redirect){

        System.out.println(ldao.findId(ldto));

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

    @RequestMapping("/findingPw")
    @ResponseBody
    @Transactional(rollbackFor = {Exception.class})
    public Map<String, Boolean> findingPw(@RequestBody LoginDto ldto){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        if(ldao.findPw(ldto)){
            msg.put("res", true);
        }else{
            msg.put("res", false);
        }

        return msg;

    }

    @RequestMapping("/changePw")
    @Transactional(rollbackFor = {Exception.class})
    public String changePw(RedirectAttributes redirect, LoginDto ldto){

        ldto.setPassword(ldto.getPassword());

        if(ldao.changePw(ldto) == 1){
            redirect.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 다시 로그인해주세요.");
            return "redirect:/";
        }else{
            redirect.addFlashAttribute("msg", "오류 발생. 다시 비밀번호 찾기를 시도해주세요.");
            return "redirect:/goFindPw";
        }

    }

}
