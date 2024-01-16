package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.SearchDto;

import java.util.List;

public interface SearchService {

    public List<SearchDto> searchKeyWord(String keyWord);

}
