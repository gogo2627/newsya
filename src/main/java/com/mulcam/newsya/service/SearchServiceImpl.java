package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService{

    @Autowired
    SearchMapper sm;

    @Override
    public List<SearchDto> searchKeyWord(String keyWord) {
        return sm.searchKeyWord(keyWord);
    }

}
