package com.mulcam.newsya.service;

import com.mulcam.newsya.dto.InterestDto;
import com.mulcam.newsya.dto.SearchDto;
import com.mulcam.newsya.mapper.SearchMapper;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

@Service
public class SearchServiceImpl implements SearchService{

    @Autowired
    SearchMapper sm;

    @Autowired
    InterestDto idto;

    @Override
    public List<SearchDto> searchKeyWord(String keyWord) { return sm.searchKeyWord(keyWord); }

    @Override
    public List<SearchDto> getEconomyArticle() {
        return sm.getEconomyArticle();
    }

    @Override
    public List<SearchDto> getSocialArticle() {
        return sm.getSocialArticle();
    }

    @Override
    public List<SearchDto> getForeignArticle() {
        return sm.getForeignArticle();
    }

    @Override
    public List<SearchDto> getPoliticsArticle() {
        return sm.getPoliticsArticle();
    }

    @Override
    public List<SearchDto> getMainArticle(String id) {
        return sm.getMainArticle(id);
    }

    @Override
    public List<InterestDto> getInterest(String id) {
        sm.createCategoryTable();
        System.out.println("테이블 생성");
        return sm.getInterest(id);
    }

    public String updateInterest(InterestDto idto){

        String res = "관심분야 설정 중 에러 발생";

        try{
            System.out.println("a");
            if(sm.updateInterest(idto) == 1){
                System.out.println("b");
                if(sm.selectInterest(idto) != null && !sm.selectInterest(idto).isEmpty()){
                    System.out.println("c");
                    res = sm.selectInterest(idto);
                }

            }else{
                System.out.println("[Category Update Error]");
            }

        }catch(Exception e){
            System.out.println("[Category Update Error]");
            e.printStackTrace();
        }

        return res;
    }

}
