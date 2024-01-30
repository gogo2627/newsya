package com.mulcam.newsya.controller;

import com.mulcam.newsya.common.Sms;
import com.mulcam.newsya.service.RegisterService;
import com.mulcam.newsya.dto.MessageDto;
import com.mulcam.newsya.dto.SmsResponseDto;
import com.mulcam.newsya.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Controller
public class RegisterController {

    @Autowired
    private RegisterService rdao;

    @Autowired
    private SmsResponseDto sdto;

    @Autowired
    private MessageDto mdto;

    @Autowired
    private Sms sms;

    @Autowired
    private PasswordEncoder pwEncoder;

    @RequestMapping("/goRegister")
    public String goRegister(@ModelAttribute("msg") String msg, Model model){

        model.addAttribute("msg", msg);
        return "register";

    }

    @PostMapping("/duplicateChk")
    @ResponseBody
    public Map<String, Boolean> idDupChk(@RequestBody UserDto udto){

        System.out.println(udto.getId());

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        boolean res = Objects.equals(rdao.DupChk(udto.getId()), "") || rdao.DupChk(udto.getId()) == null;

        System.out.println(res);
        msg.put("res", res);

        return msg;

    }

    @RequestMapping("/sendAuth")
    @ResponseBody
    public Map<String, Boolean> sendAuthNum(@RequestBody MessageDto mdto){

        HashMap<String, Boolean> msg = new HashMap<>();

        System.out.println(mdto.getTo());

        // 문자 전송 및 결과
        msg.put("res", sms.sendSmsResponse(mdto.getTo()));

        return msg;
    }

    @RequestMapping("/authCheck")
    @ResponseBody
    public Map<String, Boolean> authChk(@RequestBody MessageDto mdto){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        if(sms.isVerify(mdto)){
            msg.put("res", true);
        }else{
            msg.put("res", false);
        }

        return msg;
    }

    @RequestMapping("/regUser")
    @Transactional(rollbackFor = {Exception.class})
    public String regUser(UserDto udto, RedirectAttributes redirect){

        // 비밀번호 암호화
        udto.setPassword(pwEncoder.encode(udto.getPassword()));

        if (rdao.regUser(udto) == 1) {
            redirect.addFlashAttribute("msg", "회원가입을 축하드립니다. 다시 로그인해주세요.");
            return "redirect:/";
        } else {
            redirect.addFlashAttribute("msg", "회원가입을 다시 해주세요.");
            return "redirect:/goRegister";
        }

    }

}
