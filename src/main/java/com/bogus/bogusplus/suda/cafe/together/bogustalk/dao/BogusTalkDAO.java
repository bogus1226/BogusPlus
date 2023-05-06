package com.bogus.bogusplus.suda.cafe.together.bogustalk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.cafe.together.bogustalk.model.BogusTalk;

@Repository
public interface BogusTalkDAO {
	
	public List<BogusTalk> selectBogusTalkListByTogetherId(
			@Param("togetherId") int togetherId);
	
	public int insertTalk(
			@Param("togetherId") int togetherId
			, @Param("userId") int userId
			, @Param("talk") String talk);
}
