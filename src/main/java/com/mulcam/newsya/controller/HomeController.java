package com.mulcam.newsya.controller;


import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.dto.InterestDto;
import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.SearchService;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class HomeController {

    @Autowired
    SearchService ss;

    @Autowired SearchDto sdto;

    @Autowired InterestDto idto;

    @RequestMapping("/")
    public String root(Model model){

        List<SearchDto> elist = ss.getEconomyArticle();
        List<SearchDto> flist = ss.getForeignArticle();
        List<SearchDto> slist = ss.getSocialArticle();
        List<SearchDto> plist = ss.getPoliticsArticle();
        List<String> ulist = ss.getUrlFromArticle();

        model.addAttribute("elist", elist);
        model.addAttribute("flist", flist);
        model.addAttribute("slist", slist);
        model.addAttribute("plist", plist);
        model.addAttribute("ulist", ulist);

        return "mainpage";
    }

    @RequestMapping("/searchKeyWord")
    public String search(Model model, SearchDto sdto) {
        // 검색 결과가 있을 때만 검색 결과를 가져와 모델에 추가
        if (StringUtils.hasText(sdto.getKeyWord())) {
            List<SearchDto> searchResults = ss.searchKeyWord(sdto.getKeyWord()); // 검색 결과 가져오기
            model.addAttribute("boardList", searchResults); // 검색 결과를 모델에 추가
        }

        return "listpage"; // listpage.jsp로 이동
    }

    @RequestMapping("/getInterest")
    @ResponseBody
    public Map<String, Boolean[]> getInterest(@RequestBody InterestDto idto){
        Map<String, Boolean[]> msg =  new HashMap<String, Boolean[]>();

        List<InterestDto> interest = ss.getInterest(idto.getId());

        Boolean [] arr = {interest.get(0).getPolitics(), interest.get(0).getEconomic(), interest.get(0).getSocial(), interest.get(0).getForeign()};

        msg.put("res", arr);

        return msg;
    }

    @RequestMapping("/updateInterest")
    @ResponseBody
    @Transactional(rollbackFor = {Exception.class})
    public Map<String, String> updateInterest(@RequestBody InterestDto idto){

        Map<String, String> msg = new HashMap<String, String>();

        msg.put("res", ss.updateInterest(idto));

        return msg;
    }

}

// 동적 매핑
// https://huistorage.tistory.com/135
