package com.mulcam.newsya.mapper;

import com.mulcam.newsya.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RegisterMapper {

    @Select(" SELECT LOGIN_ID FROM USER WHERE LOGIN_ID = #{id} ")
    String DupChk(String id);

    @Insert(" INSERT INTO USER VALUES(UUID_TO_BIN(UUID(), 1), #{id}, #{password}, #{name}, #{email}, #{phone}, NOW(), NOW()) ")
    int regUser(UserDto udto);

}

// org.apache.ibatis.reflection.ReflectionException: There is no getter for property named 'pw' 에러
// mapper에 Insert문에 들어가는 매개변수 이름과 dto 매개변수명과 달라서 발생한 문제이다.

// Type handler was null on parameter mapping for property 'uuid'. It was either not specified and/or could not be found for the javaType (java.util.UUID) : jdbcType (null) combination.
// UUID 객체를 그대로 넣을 수는 없다. 그래서 toString으로 변환한 뒤에, varchar타입으로 sql에서 쓸 수 있게 해야한다. (V4기준)
// 이 프로젝트에서는 V1을 사용하되, 자바 대신 MYSQL 내장 함수 사용한다.
// mysql은 sequential한 db이기 때문에 일부 규칙이 있는 v1이 좀 더 유리하다고 판단
// https://hoing.io/archives/5248
// https://wjdtn7823.tistory.com/59
// https://chanos.tistory.com/entry/MySQL-UUID%EB%A5%BC-%ED%9A%A8%EC%9C%A8%EC%A0%81%EC%9C%BC%EB%A1%9C-%ED%99%9C%EC%9A%A9%ED%95%98%EA%B8%B0-%EC%9C%84%ED%95%9C-%EB%85%B8%EB%A0%A5%EA%B3%BC-%ED%95%9C%EA%B3%84
// https://devs0n.tistory.com/87
// https://velog.io/@nayoon-kim/%EB%A9%B4%EC%A0%91-id%EB%A5%BC-%EC%99%9C..bigint
