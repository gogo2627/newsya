package com.mulcam.newsya.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class InterestDto {

    private String id;
    private Boolean foreign;
    private Boolean economic;
    private Boolean politics;
    private Boolean social;
    private String index;

}
