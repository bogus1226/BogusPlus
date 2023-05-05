package com.bogus.bogusplus.suda.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.model.Suda;

@Repository
public interface SudaDAO {

	public int inputInfo(
			@Param("mbti") String mbti
			, @Param("introduce") String introduce
			, @Param("type") String type
			, @Param("userId") int userId);
	
	public int infoIsDuplicate(@Param("userId") int userId);
	
	public Suda selectSudaByUserId(@Param("userId") int userId);
}
