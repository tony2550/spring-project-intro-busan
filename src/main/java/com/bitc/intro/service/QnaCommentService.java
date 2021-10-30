package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.QnaComment;
import com.bitc.intro.mapper.QnaCommentMapper;
import com.bitc.intro.mapper.QnaMapper;

@Service
public class QnaCommentService {
	@Autowired
	private QnaCommentMapper qnaCommentMapper;
	@Autowired
	private QnaMapper qnaBoardMapper;

	// 추가
	@Transactional
	public void insert(QnaComment comment) {
		qnaCommentMapper.insert(comment);
		/*
		 * qnaBoardMapper.updateReplyCnt(comment.getQnaId(), 1);
		 */
	}

	@Transactional
	public List<QnaComment> getList(int qnaId) {
		return qnaCommentMapper.getList(qnaId);
	}

	@Transactional
	public void delete(int id) {
		QnaComment qcommnet = qnaCommentMapper.findByNum(id);
		/* qnaBoardMapper.updateReplyCnt(qcommnet.getQnaId(), -1); */
		qnaCommentMapper.delete(id);

	}

}
