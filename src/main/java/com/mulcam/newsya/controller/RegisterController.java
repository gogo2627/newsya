package com.mulcam.newsya.controller;

import com.mulcam.newsya.common.Sms;
import com.mulcam.newsya.dao.RegisterDao;
import com.mulcam.newsya.dao.SmsDao;
import com.mulcam.newsya.dto.MessageDto;
import com.mulcam.newsya.dto.SmsResponseDto;
import com.mulcam.newsya.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
public class RegisterController {

    @Autowired
    private RegisterDao rdao;

    @Autowired
    private SmsDao sdao;

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

    @RequestMapping("/duplicateChk")
    public java.util.Map<String, Integer> idDupChk(UserDto dto){

        Map<String, Integer> msg = new HashMap<String, Integer>();
        int res = 0;

        if(!Objects.equals(rdao.DupChk(dto), "") || rdao.DupChk(dto) != null){
            res = 1;
        }

        msg.put("res", res);

        return msg;

    }

    @RequestMapping("/sendAuth")
    public Map<String, String> sendAuthNum(MessageDto mdto){

        HashMap<String, String> msg = new HashMap<>();

        // 문자 전송
        sdao.sendSmsResponse(mdto.getTo());

        // msg 에 값 입력
        msg.put("res", "true");

        return msg;
    }

    @RequestMapping("/authCheck")
    public Map<String, Boolean> authChk(String auth){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        if(sms.isVerify(mdto.getTo())){
            msg.put("res", true);
        }else{
            msg.put("res", false);
        }

        return msg;
    }

    @RequestMapping("/authResend")
    public Map<String, Boolean> authResend(MessageDto dto){

        Map<String, Boolean> msg = new HashMap<String, Boolean>();

        sdao.sendSmsResponse(mdto.getTo());

        msg.put("res", true);

        return msg;
    }


}
