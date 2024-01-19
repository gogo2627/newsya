package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Array;
import java.util.List;

@Service
public class SearchServiceImpl implements SearchService{

    @Autowired
    SearchMapper sm;

    @Override
    public List<SearchDto> searchKeyWord(String keyWord) { return sm.searchKeyWord(keyWord); }

    @Override
    public List<SearchDto> getEconomyArticle() {
        return sm.getEconomyArticle();
    }

    @Override
    public List<SearchDto> getSocialArticle() {
        return sm.getSocialArticle();
    }

    @Override
    public List<SearchDto> getForeignArticle() {
        return sm.getForeignArticle();
    }

    @Override
    public List<SearchDto> getPoliticsArticle() {
        return sm.getPoliticsArticle();
    }

    @Override
    public List<SearchDto> getMainArticle(String id) {
        return sm.getMainArticle(id);
    }

}
