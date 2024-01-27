package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String getAllNews(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 4; // 페이지당 보여줄 게시물 수
        int offset = (page - 1) * pageSize; // 오프셋 계산

        List<BoardDto> boardList = boardService.getLimitedBoards(offset, pageSize);
        model.addAttribute("boardList", boardList);

        // 현재 페이지 번호 전달
        model.addAttribute("currentPage", page);

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

    @RequestMapping("/category/{category}/article/{id}")
    public String getArticleListStartingFromId(@PathVariable("category") String category, @PathVariable("id") int id, Model model) {
        List<BoardDto> articleList;

        if (category.equals("all")) {
            articleList = boardService.getArticleListStartingFromId(id);
        } else {
            articleList = boardService.getArticleListStartingFromIdAndCategory(id, category);
        }

        model.addAttribute("boardList", articleList);
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