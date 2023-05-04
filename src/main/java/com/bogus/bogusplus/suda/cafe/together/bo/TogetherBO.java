package com.bogus.bogusplus.suda.cafe.together.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.together.dao.TogetherDAO;
import com.bogus.bogusplus.suda.cafe.together.model.Status;
import com.bogus.bogusplus.suda.cafe.together.model.Together;
import com.bogus.bogusplus.suda.cafe.together.model.TogetherDetail;
import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;


@Service
public class TogetherBO {
	
	@Autowired
	private TogetherDAO togetherDAO;
	
	@Autowired
	private UserBO userBO;
	
	// together리스트 가져오는 공통 코드!
	public TogetherDetail generateTogether(Together together) {
		User user = userBO.getUserById(together.getUserId());
		
		TogetherDetail togetherDetail = new TogetherDetail();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
		
		String date = simpleDateFormat.format(together.getDate()); 
		
		int statusCount = togetherDAO.selectCountTogetherStatus(together.getId());
		
		togetherDetail.setId(together.getId());
		togetherDetail.setUserId(together.getUserId());
		togetherDetail.setCafeId(together.getCafeId());
		togetherDetail.setNickName(user.getNickName());
		togetherDetail.setContent(together.getContent());
		togetherDetail.setTitle(together.getTitle());
		togetherDetail.setPlaceName(together.getPlaceName());
		togetherDetail.setPlaceAddressX(together.getPlaceAddressX());
		togetherDetail.setPlaceAddressY(together.getPlaceAddressY());
		togetherDetail.setDate(date);
		togetherDetail.setStatusCount(statusCount);
		
		return togetherDetail;
	}

	public int addTogether(
			int userId
			, int cafeId
			, String title
			, String placeName
			, String placeAddressX
			, String placeAddressY
			, Date date
			, String content) {
		
		return togetherDAO.insertTogether(userId, cafeId, title, placeName, placeAddressX, placeAddressY, date, content);
	}
	
	// 함께하기 화면에 나오는 리스트
	public List<TogetherDetail> getTogetherList(
			int userId
			, int cafeId) {
		
		List<Together> togetherList = togetherDAO.selectGetTogetherList(userId, cafeId);
		
		List<TogetherDetail> togetherDetailList = new ArrayList<>();
		
		for(Together together:togetherList) {
			
			Status status = togetherDAO.getStatus(userId, together.getId());
			
			if(status == null) {
				
				TogetherDetail togetherDetail = generateTogether(together);
				
				togetherDetailList.add(togetherDetail);
			}
		}
		
		return togetherDetailList;
	}
	
	// 함께하기 대기중 화면에 나오는 리스트
	public List<TogetherDetail> getTogetherWatingList(
			int userId
			, int cafeId) {
		
		List<Together> togetherList = togetherDAO.selectGetTogetherList(userId, cafeId);
		
		List<TogetherDetail> togetherDetailList = new ArrayList<>();
		
		for(Together together:togetherList) {
			
			Status status = togetherDAO.getStatus(userId, together.getId());
			
			if(status != null) {
				int statusNumber = status.getStatus();
				
				if(statusNumber == 1) {
					
					TogetherDetail togetherDetail = generateTogether(together);
					
					togetherDetailList.add(togetherDetail);
				}
			}
		}
		
		return togetherDetailList;
	}
	
	// 함께하기 마이페이지 화면에 나오는 리스트
	public List<TogetherDetail> getTogetherMyPageList(
			int userId
			, int cafeId) {
		
		List<Together> togetherList = togetherDAO.selectGetTogetherList(userId, cafeId);
		
		List<TogetherDetail> togetherDetailList = new ArrayList<>();
		
		for(Together together:togetherList) {
			
			Status status = togetherDAO.getStatus(userId, together.getId());
			
			if(status != null) {
				int statusNumber = status.getStatus();
				
				if(statusNumber == 1) {
					
					TogetherDetail togetherDetail = generateTogether(together);
					
					togetherDetailList.add(togetherDetail);
				}
			}
		}
		
		return togetherDetailList;
	}
	
	public int attendTogether(
			int togetherId
			, int userId) {
		
		return togetherDAO.insertAttendStatus(togetherId, userId);
	}
	
	public int notAttendTogether(
			int togetherId
			, int userId) {
		
		return togetherDAO.deleteAttendStatus(togetherId, userId);
	}


	
}
