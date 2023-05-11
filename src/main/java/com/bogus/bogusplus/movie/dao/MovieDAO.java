package com.bogus.bogusplus.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.movie.model.Interest;
import com.bogus.bogusplus.movie.model.Record;

@Repository
public interface MovieDAO {

	public int insertInterest(
			@Param("movieId") int movieId
			, @Param("userId") int userId
			, @Param("posterPath") String posterPath);
	
	public int selectIsDuplicateInterest(
			@Param("movieId") int movieId
			, @Param("userId") int userId);
	
	public int deleteInterest(
			@Param("movieId") int movieId
			, @Param("userId") int userId);
	
	public List<Interest> selecetGetMovieInterest(int userId);
	
	public int insertRecord(
			@Param("userId") int userId
			, @Param("movieId") int movieId
			, @Param("movieName") String movieName);
	
	public int selectIsDuplicateRecord(
			@Param("userId") int userId
			, @Param("movieId") int movieId);
	
	public List<Record> selectGetRecordListByUserId(
			@Param("userId") int userId);
	

}
