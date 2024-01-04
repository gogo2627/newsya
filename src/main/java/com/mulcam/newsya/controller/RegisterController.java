package com.mulcam.newsya.controller;

import com.mulcam.newsya.dao.RegisterDao;
import com.mulcam.newsya.dao.SmsDao;
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

    @RequestMapping("/goRegister")
    public String goRegister(){

        return "register";

    }

    @RequestMapping("/duplicateChk")
    public Map<String, Integer> idDupChk(UserDto dto){

        Map<String, Integer> msg = new HashMap<String, Integer>();
        int res = 0;

        if(!Objects.equals(rdao.DupChk(dto), "") || rdao.DupChk(dto) != null){
            res = 1;
        }

        msg.put("res", res);

        return msg;

    }

    @RequestMapping("/sendAuth")
    public Map<String, Integer> sendAuthNum(String num){

        Map<String, Integer> msg = new HashMap<String, Integer>();

        // 문자 전송

        // msg 에 값 입력
        return msg;
    }


}
