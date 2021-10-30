package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.QnaComment;
import com.bitc.intro.mapper.QnaCommentMapper;


@Repository
public class QnaCommentRepository {
	@Autowired
	private QnaCommentMapper qnaCommentMapper;
	public List<QnaComment> getList(int qnaId){
		return qnaCommentMapper.getList(qnaId);
	};  // 전체보기
	
	public void insert(QnaComment comment) {
		qnaCommentMapper.insert(comment);
	}; //추가
	
	public QnaComment findByNum(int id) {
		return qnaCommentMapper.findByNum(id);
	}; //상세보기
	
	public void delete(int id) {
		qnaCommentMapper.delete(id);
	}; //삭제
}
