package com.mulcam.newsya.common;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Random;

public class Authentication {

    public int rnd(){
        
        // 4자리 난수 생성
        Random rnd = new Random();

        return rnd.nextInt(9999) + 1000;
    }

    public int sendAuthSms(int p_num){

        String method = "POST";
        String url = "";
        String req_Url = "sms/v2/services";

    }

    public String makeSignature() {
        String space = " ";					// one space
        String newLine = "\n";					// new line
        String method = "GET";					// method
        String url = "/photos/puppy.jpg?query1=&query2";	// url (include query string)
        String timestamp = "{timestamp}";			// current timestamp (epoch)
        String accessKey = "{accessKey}";			// access key id (from portal or Sub Account)
        String secretKey = "{secretKey}";

        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();

        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.encodeBase64String(rawHmac);

        return encodeBase64String;
    }



}
