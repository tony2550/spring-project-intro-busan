package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Manager;
import com.bitc.intro.mapper.ManagerMapper;

@Repository
public class ManagerRepository {

	@Autowired
	private ManagerMapper managerMapper;
	
	public int getCountById(String username) {
		return managerMapper.getCountById(username);
	}
	
	public Manager getManagerById(String username) {
		return managerMapper.getManagerById(username);
	}
	
	public List<Manager> getManagers(){
		return managerMapper.getManagers();
	}
	
}
