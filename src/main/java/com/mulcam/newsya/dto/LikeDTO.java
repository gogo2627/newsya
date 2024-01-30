package com.mulcam.newsya.dto;

public class LikeDTO {
    private int id;
    private Boolean newsLikeYN;
    private int newsId;
    private String userId;
    private Boolean commentLikeYN;
    private int commentId;

    // 생성자, 게터, 세터 등 필요한 메서드 추가

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Boolean getNewsLikeYN() {
        return newsLikeYN;
    }

    public void setNewsLikeYN(Boolean newsLikeYN) {
        this.newsLikeYN = newsLikeYN;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Boolean getCommentLikeYN() {
        return commentLikeYN;
    }

    public void setCommentLikeYN(Boolean commentLikeYN) {
        this.commentLikeYN = commentLikeYN;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
}
