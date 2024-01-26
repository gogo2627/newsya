package com.mulcam.newsya.util;

import com.mulcam.newsya.dto.Article;
import com.mulcam.newsya.dto.Paging;

import java.util.ArrayList;
import java.util.List;

public class PagingUtil {

	private Paging page = new Paging();
	public Paging initPaginationInfo(int datePerPage, int pageCount, int pageNum, int allDataCount) {

		int totalPage = allDataCount/datePerPage;
    	totalPage = (allDataCount%datePerPage)>0 ? totalPage+1 : totalPage;
    	// 총 페이지 수
    	
    	int pageGroup = pageNum/pageCount ;
    	pageGroup = (pageNum%pageCount)>0 ? pageGroup+1 : pageGroup;
    	// 현재 페이지 그룹 수
    	
    	int last = pageGroup * pageCount;
    	if(last > totalPage) {
    		last = totalPage;
    	}
    	
    	int first =  last != totalPage ? last - (pageCount-1) : last - ((last%pageCount)-1);
    	
    	
    	int prev = (first != 1) ? first-5 : 0;
    	int next = (last < totalPage) ? last+1 : 0;
    	
    	if(totalPage < 1) {
    		first = last;
    	}
    	
    	page.setDatePerPage(datePerPage);
		page.setPageCount(pageCount);
		page.setPageNum(pageNum);
		page.setStartNum(datePerPage*(pageNum-1)+1);
		page.setEndNum(pageNum * datePerPage);
		page.setAllDataCount(allDataCount);
		page.setFirst(first);
		page.setLast(last);
		page.setPrev(prev);
		page.setNext(next);
		
		return page;
	}
	
	public List<Article> getNewsListForCurrentPage(List<Article> newsList) {
		List<Article> newsListForPaging = new ArrayList<Article>();
		for(int j=page.getStartNum()-1; j<page.getEndNum(); j++) {
			if(j >= newsList.size()) break;
			newsListForPaging.add(newsList.get(j));
		}
		return newsListForPaging;
	}
	
}
