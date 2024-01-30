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
public class SearchDto {

    private String keyWord; // 입력받은 검색어
    private int id;
    private String category;
    private String title; // 검색 결과 해당 기사 제목
    private String content; // 검색 결과 해당 기사 내용
    private String img; // 검색 결과 해당 기사 이미지
    private Date date;
    private String url;

    @Override
    public String toString(){
        return "URL: " + url + "제목 : " + this.title + "\n" + "내용 : " + this.content + "\n" + "이미지 : " + this.img + "\n" + "날짜 : " + this.date;
    }

}

