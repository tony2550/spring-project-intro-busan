package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.Qna;

@Mapper
public interface QnaMapper {

//	// 글 한개 등록하기
//	int insert(Qna qna);
//	
//	// 글 번호(id)에 맞는 Qna글 한개 가져오기
//	Qna getQnaById(int id);
//	
//	//Qna글 전부 가져오기
//	List<Qna> getQnas();
//
//	// 유저id에 맞는 Qna글 전부 가져오기
//	List<Qna> getQnaByUserId(int userId);
//	
//	//글 번호(id)에 맞는 Qna글 하나 삭제하기
//	int DeleteQnaById(int id);
//	
//	//글 번호(id)에 맞는 Qna글 하나 수정하기
//	void updateQnaById(int id);
	
	int insert(Qna qna);  // 글 한개 등록하기
	
	int getTotalCount(); // 전체 글개수 가져오기
	
	int nextQnaNum(); // 다음 insert할 글번호 생성하기
	
	void updateReadcount(int id); // 글번호에 해당하는 글의 조회수 1 증가시키기
	
	Qna getQna(int id); // 글번호에 해당하는 글 한개 가져오기
	
	List<Qna> getQnas(); // 전체 글내용 가져오기 
	
	List<Qna> getListWithPaging(Criteria cri);  // 페이징(원하는 행위치의 일정갯수) 적용된 글내용 가져오기
	
	int deleteQnaById(int id);  // 글번호에 해당하는 글 한개 삭제하기
	
	int deleteAll();
	
	void updateQna(Qna qna);
	
	public void updateReplyCnt(@Param("qnaId") int qnaId,
			@Param("amount") int amount);
	
}
