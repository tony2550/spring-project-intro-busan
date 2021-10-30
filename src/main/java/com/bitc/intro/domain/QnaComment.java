package com.bitc.intro.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaComment {
	private int id;
	private String content;
	private Date regDate;
	private int qnaId; // FK
	private int managerId; // FK
	private String userId;
}
