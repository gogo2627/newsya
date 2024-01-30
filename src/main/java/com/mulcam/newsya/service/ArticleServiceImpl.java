package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.NewsLikeDto;
import com.mulcam.newsya.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    ArticleMapper articleMapper;


    @Override
    public List<Article> selectMyLikedNews(String loginId) {
        articleMapper.createNewsLikeTable();
        return articleMapper.selectMyLikedNews(loginId);
    }

    @Override
    public int setLikedNews(NewsLikeDto newsLikeDto) {
        int res = 0;
        try{
            articleMapper.createNewsLikeTable();
            if(articleMapper.setLikedNews(newsLikeDto) > 0){
                // 데이터가 없으면 insert 1 반환, 데이터가 있으면 created_at 업데이트 2 반환
                res = 1;
            }else{
                System.out.println("[NewsLike Insert Error]");
            }
        }catch(Exception e){
            System.out.println("[NewsLike Insert Error]");
            e.printStackTrace();
        }
        return res;
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
