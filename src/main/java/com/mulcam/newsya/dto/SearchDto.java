package com.mulcam.newsya.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class SearchDto {

    private String keyWord; // 입력받은 검색어
    private String title; // 검색 결과 해당 기사 제목
    private String content; // 검색 결과 해당 기사 내용
    private String image; // 검색 결과 해당 기사 이미지

    @Override
    public String toString(){

        return "제목 : " + this.title + "\n" + "내용 : " + this.content + "\n" + "이미지 : " + this.image;

    }

}
