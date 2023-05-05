package com.bogus.bogusplus.suda.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.dao.SudaDAO;
import com.bogus.bogusplus.suda.model.Suda;

@Service
public class SudaBO {
	
	@Autowired
	private SudaDAO sudaDAO;

	public int inputInfo(String mbti, String introduce, String type, int userId) {
		
		return sudaDAO.inputInfo(mbti, introduce, type, userId);
	}
	
	public Boolean infoIsDuplicate(int userId) {
		
		int count = sudaDAO.infoIsDuplicate(userId);
		
		return count!=0;
	}
	
	public Suda getSudaByUserId(int userId) {
	
		return sudaDAO.selectSudaByUserId(userId);
	}
}
