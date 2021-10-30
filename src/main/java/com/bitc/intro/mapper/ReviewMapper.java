package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.Review;

@Mapper
public interface ReviewMapper {
	
	List<Review> getList(int restId);  // 전체보기
	
	void insert(Review review); //추가
	
	Review findByNum(int id); //상세보기
	
	void delete(int id); //삭제


}
