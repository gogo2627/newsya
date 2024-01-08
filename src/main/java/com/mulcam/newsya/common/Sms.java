package com.mulcam.newsya.common;

import com.mulcam.newsya.dto.SmsResponseDto;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@RequiredArgsConstructor
public class Sms {

    @Value("${coolsms.api.key}")
    private String apiKey;
    @Value("${coolsms.api.secretKey}")
    private String apiSecretKey;
    @Value("${coolsms.api.senderPhone}")
    private String senderPhone;


    private DefaultMessageService messageService;

    private final Redis redis;

    private SmsResponseDto sdto;

    @PostConstruct
    private void init(){
        this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, "https://api.coolsms.co.kr");
    }
    // https://velog.io/@limsubin/Spring-Boot%EC%97%90%EC%84%9C-PostConstruct-%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90

    // 단일 메시지 발송
    public SingleMessageSentResponse sendOne(String to, String authNum) {

        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom(senderPhone);
        message.setTo(to);
        message.setText("[NewsYa] 아래의 인증번호를 입력해주세요\n" + authNum);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        return response;

    }

    public int rnd(){

        // 4자리 난수 생성
        Random rnd = new Random();

        return rnd.nextInt(9999) + 1000; // 1000 - 9999?
    }

    public boolean isVerify(String to){

        return (redis.hasKey(to) && redis.getSmsCertification(to).equals(sdto.getAuthNum()));

    }

    // https://1-7171771.tistory.com/141
    // https://1-7171771.tistory.com/84
    // https://velog.io/@eqvyoo/CoolSms-Springboot-Redis-%EB%AC%B8%EC%9E%90%EB%A1%9C-%EC%9D%B8%EC%A6%9D%ED%95%98%EA%B8%B0

}
