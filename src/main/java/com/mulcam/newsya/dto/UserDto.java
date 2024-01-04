package com.mulcam.newsya.dto;

public class UserDto {
    private String name;
    private String id;
    private String pw;
    private String email;
    private String phone;

    public UserDto() {
    }

    public UserDto(String name, String id, String pw, String email, String phone) {
        this.name = name;
        this.id = id;
        this.pw = pw;
        this.email = email;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
