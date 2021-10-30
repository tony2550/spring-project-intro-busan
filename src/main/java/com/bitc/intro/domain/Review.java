package com.bitc.intro.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Review {
	private int id;
	private int grade;
	private String content;
	private String username; // FK
	
	private int restId; //레스토랑 id 
	private Date regdate;//등록일자
}

