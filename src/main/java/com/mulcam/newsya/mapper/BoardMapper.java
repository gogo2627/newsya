package com.mulcam.newsya.mapper;
import com.mulcam.newsya.dto.BoardDto;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface BoardMapper {
/*    @Select(" SELECT * FROM news ORDER BY DATE DESC LIMIT 4 ")
    List<BoardDto> getAllBoards();*/
@Select("SELECT * FROM news ORDER BY DATE DESC LIMIT 4")
List<BoardDto> getAllBoards();

    @Select("SELECT * FROM news WHERE category = #{category} ORDER BY DATE DESC LIMIT 4")
    List<BoardDto> getNewsByCategory(@Param("category") String category);
}
