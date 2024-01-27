package com.mulcam.newsya.controller;

import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping({"/listpage", "/category/all"})
    public String getAllNews(Model model) {
        List<BoardDto> boardList = boardService.getAllBoards();
        int limit = 15;
        List<BoardDto> limitedNews = boardList.subList(0, Math.min(limit, boardList.size()));
        model.addAttribute("boardList", limitedNews); // 모든 카테고리로 설정

        // 카테고리 라벨 설정
        String categoryLabel = getCategoryLabel("all");
        model.addAttribute("categoryLabel", categoryLabel);

        return "listpage";
    }

    @RequestMapping("/category/{category}")
    public String getCategoryNews(@PathVariable("category") String category, Model model) {
        List<BoardDto> categoryNews = boardService.getNewsByCategory(category);
        model.addAttribute("boardList", categoryNews);

        // 카테고리 라벨 설정
        String categoryLabel = getCategoryLabel(category);
        model.addAttribute("categoryLabel", categoryLabel);

        return "listpage";
    }

    @PostMapping("/toggleLike")
    @ResponseBody
    public String toggleLike(@RequestParam("newsId") int newsId, HttpSession session) {
        if (session.getAttribute("id") == null) {
            return "로그인이 필요합니다.";
        } else {
            // 좋아요 토글 기능 호출
            boardService.toggleLike(newsId, (String) session.getAttribute("id"));
            return "좋아요 상태가 변경되었습니다.";
        }
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