package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SearchMapper {

    @Select(" SELECT TITLE, CONTENT, IMG FROM news WHERE TITLE LIKE CONCAT('%', #{keyWord}, '%') AND CONTENT LIKE CONCAT('%', #{keyWord}, '%') ORDER BY DATE DESC LIMIT 15 ")
    List<SearchDto> searchKeyWord(String keyWord);

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'economic' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getEconomyArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'foreign' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getForeignArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'society' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getSocialArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'politics' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getPoliticsArticle();

    @Select(" SELECT TITLE, CONTENT, IMG, DATE FROM news WHERE ID = #{id} ")
    List<SearchDto> getMainArticle(String id);

}
