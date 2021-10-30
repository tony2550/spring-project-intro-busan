package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Review;
import com.bitc.intro.mapper.ReviewMapper;


@Repository
public class ReviewRepository {
	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<Review> getList(int restId){
		return reviewMapper.getList(restId);
	};  // 전체보기
	
	public void insert(Review review) {
		reviewMapper.insert(review);
	}; //추가
	
	public Review findByNum(int id) {
		return reviewMapper.findByNum(id);
	}; //상세보기
	
	public void delete(int id) {
		reviewMapper.delete(id);
	}; //삭제
}
