package com.mulcam.newsya.mapper;
import com.mulcam.newsya.dto.BoardDto;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface BoardMapper {
/*    @Select(" SELECT * FROM news ORDER BY DATE DESC LIMIT 4 ")
    List<BoardDto> getAllBoards();*/

    @Select("SELECT * FROM news ORDER BY DATE DESC LIMIT 4")
    List<BoardDto> getAllBoards();


    @Select("SELECT * FROM news WHERE category = #{category} ORDER BY DATE DESC LIMIT 4")
    List<BoardDto> getNewsByCategory(@Param("category") String category);

    @Update("UPDATE news SET NEWS_LIKE_YN = CASE WHEN NEWS_LIKE_YN = 1 THEN 0 ELSE 1 END WHERE NEWS_ID = #{newsId} AND USER_ID = #{userId}")
    void toggleLike(@Param("newsId") int newsId, @Param("userId") String userId);
}
