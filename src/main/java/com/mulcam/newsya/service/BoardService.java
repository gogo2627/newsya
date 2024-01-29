package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.BoardDto;

import java.sql.Date;
import java.util.List;

public interface BoardService {

    public List<BoardDto> getAllBoards();

    List<BoardDto> getNewsByCategory(String category);

    List<BoardDto> getSpecificDateNewsByCategory(String category, Date date);

    List<BoardDto> getAllNewsByDate(Date date);

    List<BoardDto> getArticleListStartingFromId(int id);

    List<BoardDto> getArticleListStartingFromIdAndCategory(int id, String category);

    List<BoardDto> getLimitedBoards(int offset, int limit);
}
