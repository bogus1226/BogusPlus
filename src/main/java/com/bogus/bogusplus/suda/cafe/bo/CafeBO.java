package com.bogus.bogusplus.suda.cafe.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.dao.CafeDAO;
import com.bogus.bogusplus.suda.cafe.model.Cafe;

@Service
public class CafeBO {

	@Autowired
	private CafeDAO cafeDAO;
	
	public int addCafe(String name, int userId) {
		
		return cafeDAO.insertCafe(name, userId);
	}
	
	public int isduplicateCafe(int userId) {
		
		return cafeDAO.isduplicateCafe(userId);
	}
	
	public Cafe getCafeInfo(int userId) {
		
		return cafeDAO.selectCafeInfo(userId);
	}
	
	public List<Cafe> getSearchCafeInfo(String search) {
		
		String searchInfo = "%" + search + "%";
		
		return cafeDAO.selectSearchCafeInfo(searchInfo);
	}
	
	public Cafe getCafeById(int cafeId) {
		
		return cafeDAO.selectCafeById(cafeId);
	}

}
