package com.bitc.intro.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private boolean prev , next; // 이전, 다음
	
	private int total; // 전체 글개수
	private Criteria cri; // 요청한 페이지번호, 한페이지당 글 개수

	
	public PageDTO(Criteria cri , int total) { //Criteria 매개변수로 주입 받는다.
		this.cri = cri;
		this.total = total;
		
		// 여기서 숫자 5는 페이지블록을 구성하는 페이지 개수
		this.endPage = (int) Math.ceil(cri.getPageNum() / 5.0) * 5; // 페이지 번호 개수 5개로 설정
		
		this.startPage = this.endPage - (5-1); // 시작페이지 = endPage - 페이지번호 개수 + 1 
		
		// 실제 끝페이지
		int realEnd = (int) Math.ceil((double) total / cri.getAmount());
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		} 
		
		this.prev = this.startPage > 1; // 시작페이지가 1이 아니면 이전 페이지블록으로 갈 수 있다
		
		this.next = this.endPage < realEnd; // 끝페이지가 실제페이지보다 작다면 다음 페이지블록으로 갈 수 있다.
	}
	
	public String makeSearch(int pageNum, int total) {
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("pageNum", pageNum)
	            .queryParam("amount", cri.getAmount())
	            .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	            .queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
	            .build(); 
	    return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
	
	
}