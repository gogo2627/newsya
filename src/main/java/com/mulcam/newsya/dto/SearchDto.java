package com.mulcam.newsya.dto;


public class SearchDto {

    private String searchWord;

    public SearchDto(){}

    public SearchDto(String searchWord) {
        this.searchWord = searchWord;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }
}
