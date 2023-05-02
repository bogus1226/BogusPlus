package com.bogus.bogusplus.suda.cafe.together.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TogetherDAO {

	public int insertTogether(
			@Param("userId") int userId
			, @Param("cafeId") int cafeId
			, @Param("title") String title
			, @Param("placeName") String placeName
			, @Param("placeAddressX") String placeAddressX
			, @Param("placeAddressY") String placeAddressY
			, @Param("date") String date
			, @Param("content") String content);
}
