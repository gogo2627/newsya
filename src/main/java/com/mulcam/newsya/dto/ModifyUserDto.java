package com.mulcam.newsya.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ModifyUserDto {

    private String password;
    private String newPassword;
    private String newPasswordConfirm;
    private String name;
    private String email;
    private String phoneNumber;

}
