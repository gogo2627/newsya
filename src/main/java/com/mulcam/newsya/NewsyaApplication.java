package com.mulcam.newsya;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
// @ComponentScan(basePackages = "com.mulcam.newsya")
// SpringBootApplication에 기본적으로 ComponentScan이 들어가있다.... 그런데 왜 못찾지...?
public class NewsyaApplication {

	public static void main(String[] args) {
		SpringApplication.run(NewsyaApplication.class, args);
	}

	// https://hye0-log.tistory.com/28
	// jsp + jar의 문제점

}
