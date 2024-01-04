package com.mulcam.newsya.dto;

import java.util.List;

public class SmsRequestDto {

    private String type;
    private String from;
    private String content;
    private List<MessageDto> messages;

    public SmsRequestDto(){}

    public SmsRequestDto(String type, String from, String content, List<MessageDto> messages) {
        this.type = type;
        this.from = from;
        this.content = content;
        this.messages = messages;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<MessageDto> getMessages() {
        return messages;
    }

    public void setMessages(List<MessageDto> messages) {
        this.messages = messages;
    }
}
