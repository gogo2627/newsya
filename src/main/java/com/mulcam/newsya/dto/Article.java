package com.mulcam.newsya.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("Article")
public class Article {
    private String id;
    private String title;
    private String content;
    private String img;
    public Article(String newsId, String imageUrl, String title, String content) {
        this.id = newsId;
        this.img = imageUrl;
        this.title = title;
        this.content = content;
    }
}
