package com.bitc.intro.domain;

import lombok.Data;

@Data
public class Manager {
	private int id; // pk
	private String username; // 실제 id
	private String password;
	private String name;
	private String email;
	private String gender;
	private String auth;
}
