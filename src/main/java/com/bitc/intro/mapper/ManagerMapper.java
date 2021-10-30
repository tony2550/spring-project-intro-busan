package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.Manager;

@Mapper
public interface ManagerMapper {
	int getCountById(String username);
	Manager getManagerById(String username);
	List<Manager> getManagers();
}
