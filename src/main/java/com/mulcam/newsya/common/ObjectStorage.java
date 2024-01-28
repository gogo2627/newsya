package com.mulcam.newsya.common;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Component;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;

@Component
@RequiredArgsConstructor
public class ObjectStorage {
/*
    private final AmazonS3Client s3;

    private String bucketName = "newsya";
    private String downloadFilePath = "";
    private String ObjectName = ""; // 뉴스 아이디 파일명

    public getTTSFromServer(bucketName, downloadfilePath, ObjectName){

        // download object
        try {
            S3Object s3Object = s3.getObject(bucketName, objectName);
            S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();

            OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(downloadFilePath));
            byte[] bytesArray = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = s3ObjectInputStream.read(bytesArray)) != -1) {
                outputStream.write(bytesArray, 0, bytesRead);
            }

            outputStream.close();
            s3ObjectInputStream.close();
            System.out.format("Object %s has been downloaded.\n", objectName);

        } catch (AmazonS3Exception e) {
            e.printStackTrace();
        } catch(SdkClientException e) {
            e.printStackTrace();
        }

    }
*/
}
