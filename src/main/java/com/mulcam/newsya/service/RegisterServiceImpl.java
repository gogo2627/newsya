package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.UserDto;
import com.mulcam.newsya.mapper.RegisterMapper;
import com.mulcam.newsya.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper rm;

    @Autowired
    private SearchMapper sm;

    @Autowired
    private UserDto udto;

    @Override
    public String DupChk(String id) {

        rm.createUserTable();
        return rm.DupChk(id);

    }

    @Override
    public int regUser(UserDto udto) {
        int res = 0;

        try{
            rm.createUserTable();
            sm.createCategoryTable();

            if(rm.regUser(udto) == 1){
                if(rm.insertCategory(udto.getId()) == 1){
                    res = 1;
                }else{
                    System.out.println("[Category Insert Error]");
                }
            }else{
                System.out.println("[User Insert Error]");
            }

        }catch(Exception e){
            System.out.println("[User Insert Error]");
            e.printStackTrace();
        }

        return res;

    }


}
