package com.bitc.intro.domain;

import java.util.List;

import lombok.Data;

@Data
public class Hotspot {
	private int id; 
	private String name; // 이름
	private String district; // 지역구
	private String title; // 제목
	private String subTitle; // 부제목
	private String address; // 주소
	private String phoneNum; // 전화번호
	private String url; // 홈페이지
	private String traffic; // 교통정보
	private String day; //  개장기간
	private String holiday; // 휴무일
	private String time; // 운영시간
	private String fee; // 요금정보
	private String conv; // 편의시설
	private String content; // 상세내용
	private String img; // 대표사진
	private List<Restaurant> restaurantList;
}
