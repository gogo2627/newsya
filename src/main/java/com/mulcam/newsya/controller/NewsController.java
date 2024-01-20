package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String listpage(Model model) {
        List<BoardDto> boardList = boardService.getAllBoards();
        int limit = 15;
        List<BoardDto> limitedNews = boardList.subList(0, Math.min(limit, boardList.size()));
        model.addAttribute("boardList", limitedNews); //카테고리 없이 통합으로

        // 기본 카테고리 라벨 설정
        String defaultCategoryLabel = getCategoryLabel("default");  // 예시로 "" 카테고리를 기본으로 설정
        model.addAttribute("categoryLabel", defaultCategoryLabel);
        return "listpage";
    }

    @RequestMapping("/category/{category}")
    public String getCategoryNews(@PathVariable String category, Model model) {
        List<BoardDto> categoryNews = boardService.getNewsByCategory(category);
        model.addAttribute("boardList", categoryNews);

        // 카테고리 문자열 설정
        String categoryLabel = getCategoryLabel(category);
        model.addAttribute("categoryLabel", categoryLabel);

        return "listpage";
    }

    private String getCategoryLabel(String category) {
        switch (category) {
            case "politics":
                return "\uD83C\uDF10 세계";
            case "economic":
                return "⚖\uFE0F 정치";
            case "society":
                return "\uD83E\uDD1D 사회";
            case "foreign":
                return "\uD83D\uDCB0 경제";
            // 추가 카테고리에 대한 정의
            default:
                return "통합";
        }
    }
}