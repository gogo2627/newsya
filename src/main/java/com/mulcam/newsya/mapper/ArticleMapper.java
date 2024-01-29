package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.NewsLikeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleMapper {

    void createNewsLikeTable();

    List<Article> selectMyLikedNews(String loginId);

    int setLikedNews(NewsLikeDto newsLikeDto);

}
