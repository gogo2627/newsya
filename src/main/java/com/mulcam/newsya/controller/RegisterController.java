package com.mulcam.newsya.controller;

import com.mulcam.newsya.common.Sms;
import com.mulcam.newsya.dao.RegisterDao;
import com.mulcam.newsya.dto.MessageDto;
import com.mulcam.newsya.dto.SmsResponseDto;
import com.mulcam.newsya.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
public class RegisterController {

    @Autowired
    private RegisterDao rdao;

    @Autowired
    private SmsResponseDto sdto;

    @Autowired
    private MessageDto mdto;

    @Autowired
    private Sms sms;

    @RequestMapping("/goRegister")
    public String goRegister(){

        return "register";

    }

    @PostMapping("/duplicateChk")
    @ResponseBody
    public Map<String, Boolean> idDupChk(@RequestBody UserDto udto){

        System.out.println("중복체크");
        System.out.println(udto.getId());

        Map<String, Boolean> msg = new HashMap<String, Boolean>();
        //int res = false;
         /*
        if(!Objects.equals(rdao.DupChk(dto), "") || rdao.DupChk(dto) != null){
            res = 1;
        }
        */
        boolean res = Objects.equals(rdao.DupChk(udto.getId()), "") || rdao.DupChk(udto.getId()) == null;

        System.out.println(res);
        msg.put("res", res);

        return msg;

    }

    @RequestMapping("/sendAuth")
    @ResponseBody
    public Map<String, String> sendAuthNum(@RequestBody MessageDto mdto){

        HashMap<String, String> msg = new HashMap<>();

        System.out.println(mdto.getTo());

        // 문자 전송
        sms.sendSmsResponse(mdto.getTo());

        // msg 에 값 입력
        msg.put("res", "true");

        return msg;
    }

    @RequestMapping("/authCheck")
    @ResponseBody
    public Map<String, Boolean> authChk(@RequestBody MessageDto mdto){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        if(sms.isVerify(mdto.getTo())){
            msg.put("res", true);
        }else{
            msg.put("res", false);
        }

        return msg;
    }

    @RequestMapping("/regUser")
    public String regUser(UserDto udto){

        rdao.regUser(udto); // 성공 실패 경우의 수 나누기, 결과 타입 찾기

        return "redirect: /";
    }

    /*
    @RequestMapping("/authResend")
    public Map<String, Boolean> authResend(MessageDto dto){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        sms.sendSmsResponse(mdto.getTo());

        msg.put("res", true);

        return msg;
    }
    */
}
