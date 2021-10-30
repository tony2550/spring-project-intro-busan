package com.bitc.intro.domain;

import java.util.List;

import lombok.Data;

@Data
public class Restaurant {
	private int rid;
	private String name;
	private String district;
	private String address;
	private String phoneNum;
	private String url;
	private String time;
	private String mainMenu;
	private String img;
	private String content;
	private int loveCount;
	private List<AttachVO> attachList;
}
