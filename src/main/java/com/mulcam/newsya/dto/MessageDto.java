package com.mulcam.newsya.dto;

public class MessageDto {
    private String to;

    public MessageDto(){}
    public MessageDto(String to) {
        this.to = to;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

}
