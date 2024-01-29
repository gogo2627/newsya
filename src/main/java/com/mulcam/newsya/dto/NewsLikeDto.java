package com.mulcam.newsya.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class NewsLikeDto {

    private String loginId;
    private String newsId;
    private String newsLikeYn;
    private String commentId;
    private String commentLikeYn;
    private Date createdAt;

}
