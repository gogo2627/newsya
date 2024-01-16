package com.mulcam.newsya.controller;


import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@org.springframework.stereotype.Controller
public class HomeController {

    @Autowired
    SearchService ss;

    @RequestMapping("/")
    public String root(){
        return "mainpage";
    }

    @RequestMapping("/searchKeyWord")
    public List<SearchDto> search(SearchDto dto){

        List<SearchDto> list = ss.searchKeyWord(dto.getKeyWord()); // 확인용. 체크끝나면 return에 직방으로 넣기.

        for (SearchDto searchDto : list) { // 확인용
            System.out.println(searchDto.toString());
        }

        return list;

    }

}
