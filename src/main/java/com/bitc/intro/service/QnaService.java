package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.Qna;
import com.bitc.intro.repository.QnaRepository;

@Service
@Transactional
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;

	public int register(Qna qna) {
		return qnaRepository.insert(qna);
	};  // 글 한개 등록하기
	
	public int getTotalCount() {
		return qnaRepository.getTotalCount();
	}; // 전체 글개수 가져오기
	
	public int nextQnaNum() {
		return qnaRepository.nextQnaNum();
	}; // 다음 insert할 글번호 생성하기
	
	public void modifyReadcount(int id) {
		qnaRepository.updateReadcount(id);
	}; // 글번호에 해당하는 글의 조회수 1 증가시키기
	
	public Qna getQna(int id) {
		return qnaRepository.getQna(id);
	}; // 글번호에 해당하는 글 한개 가져오기
	
	public List<Qna> getQnas(){
		return qnaRepository.getQnas();
	}; // 전체 글내용 가져오기 
	
	public List<Qna> getList(Criteria cri){
		return qnaRepository.getListWithPaging(cri);
	};  // 페이징(원하는 행위치의 일정갯수) 적용된 글내용 가져오기
	
	public int removeQna(int id) {
		return qnaRepository.deleteQnaById(id);
	};  // 글번호에 해당하는 글 한개 삭제하기
	
	public int removeAll() {
		return qnaRepository.deleteAll(); 
	}; //글 전체 삭제
	
	public void modifyQna(Qna qna) {
		qnaRepository.updateQna(qna);
	} //글 하나 수정

	
	



}
