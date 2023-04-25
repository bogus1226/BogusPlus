package com.bogus.bogusplus.suda.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.cafe.model.Cafe;

@Repository
public interface CafeDAO {

	public int insertCafe(
			@Param("name") String name
			, @Param("userId") int userId);
	
	public int isduplicateCafe(@Param("userId") int userId);
	
	public Cafe selectCafeInfo(@Param("userId") int userId);
	
	public List<Cafe> selectSearchCafeInfo(@Param("search") String search);
}
