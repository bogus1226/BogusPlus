package com.bogus.bogusplus.suda.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SudaDAO {

	public int inputInfo(
			@Param("mbti") String mbti
			, @Param("introduce") String introduce
			, @Param("type") String type
			, @Param("userId") int userId);
		
}
