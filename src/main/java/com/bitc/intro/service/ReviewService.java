package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.QnaComment;
import com.bitc.intro.domain.Review;
import com.bitc.intro.mapper.ReviewMapper;
import com.bitc.intro.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	// 추가
	@Transactional
	public void insert(Review review) {
		reviewRepository.insert(review);
		/*
		 * qnaBoardMapper.updateReplyCnt(comment.getQnaId(), 1);
		 */
	}

	public List<Review> getList(int restId) {
		return reviewRepository.getList(restId);
	}

	@Transactional
	public void delete(int id) {
		/*
		 * Review review = reviewMapper.findByNum(rid);
		 * qnaBoardMapper.updateReplyCnt(qcommnet.getQnaId(), -1);
		 */
		reviewRepository.delete(id);

	}

}
