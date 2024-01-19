package com.mulcam.newsya.controller;


import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.SearchService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.http.HttpResponse;
import java.util.List;

@org.springframework.stereotype.Controller
public class HomeController {

    @Autowired
    SearchService ss;

    @Autowired SearchDto sdto;

    @RequestMapping("/")
    public String root(Model model){

        List<SearchDto> elist = ss.getEconomyArticle();
        List<SearchDto> flist = ss.getForeignArticle();
        List<SearchDto> slist = ss.getSocialArticle();
        List<SearchDto> plist = ss.getPoliticsArticle();

        model.addAttribute("elist", elist);
        model.addAttribute("flist", flist);
        model.addAttribute("slist", slist);
        model.addAttribute("plist", plist);

        return "mainpage";
    }

    @RequestMapping("/searchKeyWord")
    public List<SearchDto> search(SearchDto sdto){

        List<SearchDto> list = ss.searchKeyWord(sdto.getKeyWord());

        return list;

    }

    @RequestMapping("/article/{id}")
    public String newsClickFromMain(@PathVariable("id")String id, Model model){

        List<SearchDto> article = ss.getMainArticle(id);

        model.addAttribute("article", article);
        return "한빈님 기사 요약 페이지명";
    }

}

// 동적 매핑
// https://huistorage.tistory.com/135
