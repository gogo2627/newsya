package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.BoardDto;

import java.sql.Date;
import java.util.List;

public interface BoardService {

    public List<BoardDto> getAllBoards();

    List<BoardDto> getNewsByCategory(String category);

    List<BoardDto> getSpecificDateNewsByCategory(String category, Date date, int offset, int limit);

    List<BoardDto> getAllNewsByDate(Date date, int offset, int limit);

    List<BoardDto> getArticleListStartingFromId(int id, int offset, int limit);

    List<BoardDto> getArticleListStartingFromIdAndCategory(int id, String category, int offset, int limit);

    List<BoardDto> getLimitedBoards(int offset, int limit);

    List<BoardDto> getLimitedNewsByCategory(String category, int offset, int limit);
}
