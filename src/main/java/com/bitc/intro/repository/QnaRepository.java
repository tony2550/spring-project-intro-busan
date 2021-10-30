package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.Qna;
import com.bitc.intro.mapper.QnaMapper;

@Repository
public class QnaRepository {

	@Autowired
	private QnaMapper qnaMapper;
	
	
	public int insert(Qna qna) {
		return qnaMapper.insert(qna);
	};  // 글 한개 등록하기
	
	public int getTotalCount() {
		return qnaMapper.getTotalCount();
	}; // 전체 글개수 가져오기
	
	public int nextQnaNum() {
		return qnaMapper.nextQnaNum();
	}; // 다음 insert할 글번호 생성하기
	
	public void updateReadcount(int id) {
		qnaMapper.updateReadcount(id);
	}; // 글번호에 해당하는 글의 조회수 1 증가시키기
	
	public Qna getQna(int id) {
		return qnaMapper.getQna(id);
	}; // 글번호에 해당하는 글 한개 가져오기
	
	public List<Qna> getQnas(){
		return qnaMapper.getQnas();
	}; // 전체 글내용 가져오기 
	
	public List<Qna> getListWithPaging(Criteria cri){
		return qnaMapper.getListWithPaging(cri);
	};  // 페이징(원하는 행위치의 일정갯수) 적용된 글내용 가져오기
	
	public int deleteQnaById(int id) {
		return qnaMapper.deleteQnaById(id);
	};  // 글번호에 해당하는 글 한개 삭제하기
	
	public int deleteAll() {
		return qnaMapper.deleteAll(); 
	};
	
	public void updateQna(Qna qna) {
		
		qnaMapper.updateQna(qna);
	};
	
	
}
