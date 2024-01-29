package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.InterestDto;
import com.mulcam.newsya.dto.SearchDto;
import lombok.RequiredArgsConstructor;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public interface SearchService {

    public List<SearchDto> searchKeyWord(String keyWord);

    public List<SearchDto> getEconomyArticle();

    public List<SearchDto> getSocialArticle();

    public List<SearchDto> getForeignArticle();

    public List<SearchDto> getPoliticsArticle();

    public List<String> getUrlFromArticle();

    //public List<InterestDto> getInterest(String id);

    //public String updateInterest(InterestDto idto);


}
