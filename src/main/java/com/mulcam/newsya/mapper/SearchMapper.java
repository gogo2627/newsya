package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SearchMapper {

    @Select(" SELECT TITLE, CONTENT, IMAGE FROM ARTICLE WHERE TITLE LIKE CONCAT('%', #{keyWord}, '%') AND CONTENT LIKE CONCAT('%', #{keyWord}, '%') LIMIT 15 ")
    List<SearchDto> searchKeyWord(String keyWord);

}
