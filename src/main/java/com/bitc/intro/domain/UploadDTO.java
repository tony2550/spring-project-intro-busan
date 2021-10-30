package com.bitc.intro.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UploadDTO {
	
	private String uuid;
	private String uploadpath;
	private String filename;
}
