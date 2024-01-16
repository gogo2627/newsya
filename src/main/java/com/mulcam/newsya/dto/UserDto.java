package com.mulcam.newsya.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class UserDto {

    private String name;
    private String id;
    private String password;
    private String email;
    private String phone;
    private Date createdAt;
    private Date updatedAt;

}
