package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.Paging;
import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.service.ArticleService;
import com.mulcam.newsya.service.UserService;
import com.mulcam.newsya.util.PagingUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MyPageController {

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/goEditProfile")
    public String goEditProfile(HttpSession session, Model model) {
        String loginId = (String)session.getAttribute("id");
        if(loginId == null || loginId.trim().isEmpty()) {
            return "login";
        }
        UserDto user = userService.findBy(loginId);

        model.addAttribute("user", user);
        return "editProfile";
    }

    @RequestMapping("/goLikedArticle")
    public String LikedArticle(@RequestParam(value = "pageNum", required = false) int pageNum, HttpSession session, Model model) {
        String loginId = (String)session.getAttribute("id");

        if(loginId == null || loginId.trim().isEmpty()) {
            return "login";
        }
        List<Article> newsList = articleService.selectMyLikedNews(loginId);

        //	테스트용 더미데이터 세팅 - 운영 시에는 주석 처리
//        newsList = articleService.setDummyData(newsList, 101);

        // 페이징
        PagingUtil paging = new PagingUtil();
        Paging page = paging.initPaginationInfo(6, 5, pageNum, newsList.size());
        // 한 화면에 보여질 데이터 수, 한 화면에 보여지는 페이지 수, 현재 페이지, 전체 데이터 갯수
        List<Article> newsListForPaging = paging.getNewsListForCurrentPage(newsList);

        model.addAttribute("paging", page);
        model.addAttribute("myLikedNewsList", newsListForPaging);

        return "likedArticle"; // LikedArticle.jsp로 이동
    }

}
