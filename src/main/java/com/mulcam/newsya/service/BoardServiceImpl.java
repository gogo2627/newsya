package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.BoardDto;
import com.mulcam.newsya.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Autowired
    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public List<BoardDto> getAllBoards() {
        return boardMapper.getAllBoards();
    }

    @Override
    public List<BoardDto> getNewsByCategory(String category) {
        return boardMapper.getNewsByCategory(category);
    }

    @Override
    public List<BoardDto> getSpecificDateNewsByCategory(String category, Date date) {
        return boardMapper.getSpecificDateNewsByCategory(category, date);
    }

    @Override
    public List<BoardDto> getAllNewsByDate(Date date) {
        return boardMapper.getAllNewsByDate(date);
    }

}
