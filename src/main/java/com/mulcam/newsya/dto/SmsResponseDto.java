package com.mulcam.newsya.dto;

import java.time.LocalDateTime;

public class SmsResponseDto {

    private String requestId;
    private LocalDateTime requestTime;
    private String statusCode;
    private String statusName;
    private String authNum;

    public SmsResponseDto(){}

    public SmsResponseDto(String authNum){
        this.authNum = authNum;
    }

    public SmsResponseDto(String requestId, LocalDateTime requestTime, String statusCode, String statusName, String authNum) {
        this.requestId = requestId;
        this.requestTime = requestTime;
        this.statusCode = statusCode;
        this.statusName = statusName;
        this.authNum = authNum;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public LocalDateTime getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getAuthNum() {
        return authNum;
    }

    public void setAuthNum(String authNum) {
        this.authNum = authNum;
    }

}
