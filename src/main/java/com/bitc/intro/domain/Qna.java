package com.bitc.intro.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {
	private int id;
	private String title;
	private String content;
	private String userId; // FK
	private Date regDate;//생성일
	private int readcount;//조회수

}
