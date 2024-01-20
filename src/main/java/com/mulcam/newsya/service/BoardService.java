package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.BoardDto;

import java.util.List;

public interface BoardService {

    public List<BoardDto> getAllBoards();

    List<BoardDto> getNewsByCategory(String category);
}
