package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.SearchDto;

import java.util.List;

public interface SearchService {

    public List<SearchDto> searchKeyWord(String keyWord);

    public List<SearchDto> getEconomyArticle();

    public List<SearchDto> getSocialArticle();

    public List<SearchDto> getForeignArticle();

    public List<SearchDto> getPoliticsArticle();

    public List<SearchDto> getMainArticle(String id);

}
