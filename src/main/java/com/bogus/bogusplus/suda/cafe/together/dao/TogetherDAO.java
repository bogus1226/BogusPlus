package com.bogus.bogusplus.suda.cafe.together.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.cafe.together.model.Status;
import com.bogus.bogusplus.suda.cafe.together.model.Together;

@Repository
public interface TogetherDAO {

	public int insertTogether(
			@Param("userId") int userId
			, @Param("cafeId") int cafeId
			, @Param("title") String title
			, @Param("placeName") String placeName
			, @Param("placeAddressX") String placeAddressX
			, @Param("placeAddressY") String placeAddressY
			, @Param("date") Date date
			, @Param("content") String content);
	
	public List<Together> selectGetTogetherList(
			@Param("userId") int userId
			, @Param("cafeId") int cafeId);
	
	public int selectCountTogetherStatus(
			@Param("togetherId") int togetherId);
	
	public Status getStatus(
			@Param("userId") int userId
			, @Param("togetherId") int togetherId);
	
	public int insertAttendStatus(
			@Param("togetherId") int togetherId
			,@Param("userId") int userId);
	
	public int deleteAttendStatus(
			@Param("togetherId") int togetherId
			,@Param("userId") int userId);
}
