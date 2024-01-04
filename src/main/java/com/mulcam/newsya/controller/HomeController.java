package com.mulcam.newsya.controller;


import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.dto.UserDto;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class HomeController {



    @RequestMapping("/")
    public String root(){
        return "mainpage";
    }

    @RequestMapping("/search")
    public String search(SearchDto dto){
        // 검색 api 함수

        return null;
    }

}
