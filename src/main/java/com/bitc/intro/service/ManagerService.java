package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Manager;
import com.bitc.intro.repository.ManagerRepository;

import lombok.Setter;

@Service
@Transactional
public class ManagerService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerRepository managerRepository;
	

	public int getCountById(String username) {
		return managerRepository.getCountById(username);
	}
	
	public Manager getManagerById(String username) {
		return managerRepository.getManagerById(username);
	}
	
	public List<Manager> getManagers(){
		return managerRepository.getManagers();
	}
	
}
