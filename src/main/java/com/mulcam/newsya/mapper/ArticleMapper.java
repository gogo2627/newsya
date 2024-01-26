package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.Article;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleMapper {
    List<Article> selectMyLikedNews(String loginId);

}
