package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;
import com.bitc.intro.mapper.RestaurantMapper;
import com.bitc.intro.mapper.UserMapper;

import lombok.Setter;

@Repository
public class UserRepository {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	public int insert(User user) {
		return userMapper.insert(user);
	}
	
	public int getCountById(String username) {
		return userMapper.getCountById(username);
	}
	
	public User getUserById(String username) {
		return userMapper.getUserById(username);
	}
	
	public List<User> getUsers(){
		return userMapper.getUsers();
	}
	
	public int deleteById(String username) {
		return userMapper.deleteById(username);
	}
	
	public void updateUserById(User user) {
		userMapper.updateUserById(user);
	}
	
	public List<Restaurant> getLoveList(User user) {
		return userMapper.getLoveList(user);
	}
	
	public void pressLove(int userId, int restId) {
		userMapper.pressLove(userId, restId);
	}
	
	public int checkLoveIsPressed(int userId, int restId) {
		return userMapper.checkLoveIsPressed(userId, restId);
	}
	
	public void cancleLove(int userId, int restId) {
		userMapper.cancleLove(userId, restId);
	}
	
	public List<Integer> ageReco(int age) {
		return userMapper.ageReco(age);
	}
}
