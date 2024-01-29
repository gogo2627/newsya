package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.NewsLikeDto;

import java.util.List;

public interface ArticleService {
    public List<Article> selectMyLikedNews(String loginId);

    public int setLikedNews(NewsLikeDto newsLikeDto) ;

    public List<Article> setDummyData(List<Article> newsList, int dataCount) ;

}
