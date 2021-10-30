package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.QnaComment;

@Mapper
public interface QnaCommentMapper {
	public List<QnaComment> getList(int qnaId);  // 전체보기
	public void insert(QnaComment comment); //추가
	public QnaComment findByNum(int id); //상세보기
	public void delete(int id); //삭제


}
