package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;

@Mapper
public interface UserMapper {
	int insert(User user);
	int getCountById(String username);
	User getUserById(String username);
	List<User> getUsers();
	int deleteById(String username);
	void updateUserById(User user);
	List<Restaurant> getLoveList(User user);
	void pressLove(int param1, int param2); // 좋아요 기능. love 테이블에 insert.
	int checkLoveIsPressed(int param1, int param2); // 좋아요 누른 내역이 있는지 확인
	void cancleLove(int param1, int param2); // 좋아요 취소하기
	
	List<Integer> ageReco(int age);
}
