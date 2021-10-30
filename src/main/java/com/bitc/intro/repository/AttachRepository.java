package com.bitc.intro.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.mapper.AttachMapper;

@Repository
public class AttachRepository {

	@Autowired
	private AttachMapper attachMapper;
	
	public void insertAttach(AttachVO attachVO) {
		attachMapper.insertAttach(attachVO);
	};
	
	public List<AttachVO> getAttachesByRid(int rid) {
		return attachMapper.getAttachesByRid(rid);
	};
	
	public void deleteAllAttach(int rid) {
		attachMapper.deletAllAttach(rid);
	};
	
}
