package com.bogus.bogusplus.suda.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.model.Suda;
import com.bogus.bogusplus.suda.model.TotalCount;

@Repository
public interface SudaDAO {

	public int inputInfo(
			@Param("mbti") String mbti
			, @Param("introduce") String introduce
			, @Param("type") String type
			, @Param("userId") int userId);
	
	public int infoIsDuplicate(@Param("userId") int userId);
	
	public Suda selectSudaByUserId(@Param("userId") int userId);
	
	public List<TotalCount> togetherCountList();
	
	public List<TotalCount> postCountList();
}
