package com.mulcam.newsya.common;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.time.Duration;

@RequiredArgsConstructor
@Component
public class Redis {

    private final int LIMIT_TIME = 3 * 60;

    private final StringRedisTemplate redisTemplate;

    public void setDataExpire(String phone, String certificationNumber) {
        redisTemplate.opsForValue()
                .set(phone, certificationNumber, Duration.ofSeconds(LIMIT_TIME));
    }

    public String getSmsCertification(String phone) {
        return redisTemplate.opsForValue().get(phone);
    }

    public void removeSmsCertification(String phone) {
        redisTemplate.delete(phone);
    }

    public boolean hasKey(String phone) {
        return redisTemplate.hasKey(phone);
    }

}
