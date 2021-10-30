package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;
import com.bitc.intro.repository.RestaurantRepository;
import com.bitc.intro.repository.UserRepository;

import lombok.Setter;

@Service
@Transactional
public class UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserRepository userRepository;
	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	public int resister(User user) {
		return userRepository.insert(user);
	}

	public int getCountById(String username) {
		return userRepository.getCountById(username);
	}
	
	public User getUserById(String username) {
		return userRepository.getUserById(username);
	}
	
	public List<User> getUsers(){
		return userRepository.getUsers();
	}
	
	public int deleteById(String username) {
		return userRepository.deleteById(username);
	}
	
	public void modifyUserById(User user) {
		userRepository.updateUserById(user);
	}
	
	public List<Restaurant> getLoveList(User user){
		return userRepository.getLoveList(user);
	}
	
	@Transactional
	public void pressLove(int userId, int restId) {
		userRepository.pressLove(userId, restId);
		restaurantRepository.increaseLove(restId);
	}
	
	public int checkLoveIsPressed(int userId, int restId) {
		return userRepository.checkLoveIsPressed(userId, restId);
	}
	
	@Transactional
	public void cancleLove(int userId, int restId) {
		userRepository.cancleLove(userId, restId);
		restaurantRepository.decreaseLove(restId);
	}
	
	public List<Integer> ageReco(int age) {
		return userRepository.ageReco(age);
	}
}
