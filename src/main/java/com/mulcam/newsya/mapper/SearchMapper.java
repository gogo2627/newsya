package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.InterestDto;
import com.mulcam.newsya.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SearchMapper {

    void createCategoryTable();

    @Select(" SELECT TITLE, CONTENT, IMG FROM news WHERE TITLE LIKE CONCAT('%', #{keyWord}, '%') AND CONTENT LIKE CONCAT('%', #{keyWord}, '%') ORDER BY DATE DESC LIMIT 15 ")
    List<SearchDto> searchKeyWord(String keyWord);

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE, URL FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'economic' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getEconomyArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE, URL FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'foreign' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getForeignArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE, URL FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'society' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getSocialArticle();

    @Select(" SELECT ID, TITLE, CONTENT, IMG, DATE, URL FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'politics' ORDER BY DATE DESC LIMIT 4 ")
    List<SearchDto> getPoliticsArticle();

    @Select(" SELECT url FROM ((SELECT ID, TITLE, CONTENT, IMG, DATE, CONCAT('economic_', SUBSTRING(URL, LENGTH(URL) - 16)) AS url FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'economic' ORDER BY DATE DESC LIMIT 4) UNION (SELECT ID, TITLE, CONTENT, IMG, DATE, CONCAT('foreign_', SUBSTRING(URL, LENGTH(URL) - 16)) AS url FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'foreign' ORDER BY DATE DESC LIMIT 4) UNION (SELECT ID, TITLE, CONTENT, IMG, DATE, CONCAT('society_', SUBSTRING(URL, LENGTH(URL) - 16)) AS url FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'society' ORDER BY DATE DESC LIMIT 4) UNION (SELECT ID, TITLE, CONTENT, IMG, DATE, CONCAT('politics_', SUBSTRING(URL, LENGTH(URL) - 16)) AS url FROM (SELECT * FROM news WHERE (DATE_FORMAT(NOW(), '%H:%i:%s') < '09:00:00' AND DATE = (CURDATE() - INTERVAL 1 DAY)) OR (DATE_FORMAT(NOW(), '%H:%i:%s') >= '09:00:00' AND DATE = CURDATE())) AS TODAY WHERE CATEGORY = 'politics' ORDER BY DATE DESC LIMIT 4)) AS url; ")
    List<String> getUrlFromArticle();

    @Select(" SELECT POLITICS, `FOREIGN`, ECONOMIC, SOCIAL FROM CATEGORY WHERE ID = #{id} ")
    List<InterestDto> getInterest(String id);

    /*
    @Update(" UPDATE CATEGORY SET ${index} = NOT ${index} WHERE ID = #{id} ")
    int updateInterest(InterestDto idto);

    @Select(" SELECT ${index} FROM CATEGORY WHERE ID = #{id} ")
    String selectInterest(InterestDto idto);
    */
}
