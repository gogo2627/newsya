package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.List;

@org.springframework.stereotype.Controller
public class NewsController {

    private final BoardService boardService;

    @Autowired
    public NewsController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping(value = "/list")
    public String list() {
        System.out.println("TestController home");
        return "list";
    }


    @RequestMapping("/listpage")
    public String getAllNews(Model model) {
        List<BoardDto> boardList = boardService.getAllBoards();
        int limit = 15;
        List<BoardDto> limitedNews = boardList.subList(0, Math.min(limit, boardList.size()));
        model.addAttribute("boardList", limitedNews); // 모든 카테고리로 설정

        // 카테고리 라벨 설정
        model.addAttribute("categoryLabel", "all");

        return "listpage";
    }

    @RequestMapping("/category/{category}")
    public String getCategoryNews(@PathVariable("category") String category, Model model) {

        List<BoardDto> categoryNews;

        if(category.equals("all")){
            categoryNews = boardService.getAllBoards();
        }else{
            categoryNews = boardService.getNewsByCategory(category);
        }

        model.addAttribute("boardList", categoryNews);

        // 카테고리 라벨 설정
        model.addAttribute("categoryLabel", category);

        return "listpage";
    }

    @RequestMapping("/category/{category}/date={date}")
    public String getSpecificDateCategoryNews(@PathVariable("category") String category, @PathVariable("date") Date date, Model model){

        List<BoardDto> categoryNews;

        if(category.equals("all")){
            categoryNews = boardService.getAllNewsByDate(date);
        }else{
            categoryNews = boardService.getSpecificDateNewsByCategory(category, date);
        }

        if(categoryNews.size() > 0){
            model.addAttribute("boardList", categoryNews);
        }else{
            model.addAttribute("msg", "검색 결과가 없습니다.");
        }

        // 카테고리 라벨 설정
        model.addAttribute("categoryLabel", category);
        model.addAttribute("date", date); // 사용자가 선택한 특정 날짜를 담아서 listpage.jsp로 보내준다.

        return "listpage";
    }

}