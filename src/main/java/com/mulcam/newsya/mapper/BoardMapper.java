package com.mulcam.newsya.mapper;
import com.mulcam.newsya.dto.BoardDto;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.sql.Date;
import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface BoardMapper {
/*    @Select(" SELECT * FROM news ORDER BY DATE DESC LIMIT 4 ")
    List<BoardDto> getAllBoards();*/
    @Select("SELECT * FROM news ORDER BY DATE DESC LIMIT 4")
    List<BoardDto> getAllBoards();

    @Select("SELECT * FROM news WHERE category = #{category} ORDER BY DATE DESC LIMIT 4")
    List<BoardDto> getNewsByCategory(@Param("category") String category);

    @Select(" SELECT * FROM news WHERE category = #{category} AND date = #{date} ORDER BY DATE DESC LIMIT #{offset}, #{limit} ")
    List<BoardDto> getSpecificDateNewsByCategory(@Param("category") String category, @Param("date") Date date, @Param("offset") int offset, @Param("limit") int limit);

    @Select(" SELECT * FROM news WHERE DATE = #{date} ORDER BY ID DESC LIMIT LIMIT #{offset}, #{limit} ")
    List<BoardDto> getAllNewsByDate(@Param("date") Date date, @Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT * FROM news WHERE id >= #{id} ORDER BY id ASC LIMIT #{offset}, #{limit} ")
    List<BoardDto> getArticleListStartingFromId(@Param("id") int id, @Param("offset") int offset, @Param("limit") int limit);
 
    @Select("SELECT * FROM news WHERE id >= #{id} AND category = #{category} ORDER BY id ASC LIMIT #{offset}, #{limit} ")
    List<BoardDto> getArticleListStartingFromIdAndCategory(@Param("id") int id, @Param("category") String category, @Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT * FROM news ORDER BY DATE DESC LIMIT #{offset}, #{limit}")
    List<BoardDto> getLimitedBoards(@Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT * FROM news WHERE category = #{category} ORDER BY DATE DESC LIMIT #{offset}, #{limit}")
    List<BoardDto> getLimitedNewsByCategory(@Param("category") String category, @Param("offset") int offset, @Param("limit") int limit);

}
