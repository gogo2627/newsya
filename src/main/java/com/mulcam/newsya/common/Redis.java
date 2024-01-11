package com.mulcam.newsya.common;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.time.Duration;


@Component
@RequiredArgsConstructor
public class Redis {

    private final int LIMIT_TIME = 3 * 60;

    private final StringRedisTemplate redisTemplate;

    public void setDataExpire(String phone, String certificationNumber) {
        redisTemplate.opsForValue().set(phone, certificationNumber, Duration.ofSeconds(LIMIT_TIME));
    }

    public String getSmsCertification(String phone) {
        return redisTemplate.opsForValue().get(phone);
    }

    public void removeSmsCertification(String phone) {
        redisTemplate.delete(phone);
    }

    public boolean hasKey(String phone) {
        System.out.println("hasKey의 전화번호 : " + phone);
        return redisTemplate.hasKey(phone);
    }

}
// redis 설치
// https://inpa.tistory.com/entry/REDIS-%F0%9F%93%9A-Window10-%ED%99%98%EA%B2%BD%EC%97%90-Redis-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

// docker 이용한 redis 배포 설명
// https://velog.io/@joonghyun/CICD-Github-Action-Docker-Springboot-Redis-Slack-%EB%B9%8C%EB%93%9C%EB%B0%B0%ED%8F%AC-%EC%9E%90%EB%8F%99%ED%99%94
// https://minji6119.tistory.com/46
// https://velog.io/@jiumn/docker-githubactions-redis-hostname
// https://velog.io/@dlgkdis801/SpringBoot-Docker-DockerCompose
// https://choo.oopy.io/35c7ceb2-2bef-40c3-9033-251a47790007
// https://monynony0203.tistory.com/107

