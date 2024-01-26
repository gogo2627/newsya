package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.mapper.ArticleMapper;
import com.mulcam.newsya.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    ArticleMapper articleMapper;


    @Override
    public List<Article> selectMyLikedNews(String loginId) {
        return articleMapper.selectMyLikedNews(loginId);
    }

    @Override
    public List<Article> setDummyData(List<Article> newsList, int dataCount) {
        String content = "Aenean ornare velit lacus, ac varius enim lorem ullamcorper\n" +
                "dolore. Proin aliquam facilisis ante interdum. Sed nulla amet loremfeugiat tempus aliquam.feugiat tempus aliquam.feugiat tempus aliquam.feugiat tempus aliquam.feugiat tempus aliquam.feugiat tempus aliquam.feugiat tempus aliquam.\n" +
                "feugiat tempus aliquam.";
        Article news1 = new Article("2", "resources/image/pic01.jpg", content , content+content+content+content);
        newsList.add(news1);
        for(int i=3; i<dataCount; i++) {
            Article news = new Article(i+"", "resources/image/pic01.jpg", "제목"+i , content);
            newsList.add(news);
        }
        return newsList;
    }
}
