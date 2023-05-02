package com.bogus.bogusplus.suda.cafe.together.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.together.dao.TogetherDAO;

@Service
public class TogetherBO {
	
	@Autowired
	private TogetherDAO togetherDAO;

	public int addTogether(
			int userId
			, int cafeId
			, String title
			, String placeName
			, String placeAddressX
			, String placeAddressY
			, String date
			, String content) {
		
		return togetherDAO.insertTogether(userId, cafeId, title, placeName, placeAddressX, placeAddressY, date, content);
	}
	
	
}
