package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.Article;

import java.util.List;

public interface ArticleService {

    public List<Article> selectMyLikedNews(String loginId);

    public List<Article> setDummyData(List<Article> newsList, int dataCount) ;
}
