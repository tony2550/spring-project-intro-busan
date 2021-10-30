
 package com.bitc.intro.mapper;
  
 import java.util.List;
  
 import com.bitc.intro.domain.AttachVO;
  
 public interface AttachMapper {
  
	 void insertAttach(AttachVO attachVO);// 첨부 파일 정보를 인서트 하는 메소드
  
	 List<AttachVO> getAttachesByRid(int rid);
	 
	 void deletAllAttach(int rid);
  
 }