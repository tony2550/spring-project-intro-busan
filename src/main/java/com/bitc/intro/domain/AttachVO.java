package com.bitc.intro.domain;

import lombok.Data;

@Data
public class AttachVO {
	
	private String uuid;
	private String uploadpath;
	private String filename;
	private int thumb;
	private int restId; // 참조할 hotspot id
	
}
