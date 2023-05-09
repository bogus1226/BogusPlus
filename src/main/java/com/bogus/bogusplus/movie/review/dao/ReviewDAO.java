package com.bogus.bogusplus.movie.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.movie.review.model.Review;

@Repository
public interface ReviewDAO {

	public int insertReview(
			@Param("movieId") int movieId
			, @Param("content") String content
			, @Param("grade") int grade
			, @Param("userId") int userId);
	
	public List<Review> selectGetReviewListByMovieId(@Param("movieId") int movieId);
	
	public int selectIsDuplicateReview(
			@Param("movieId") int movieId
			, @Param("userId") int userId);
	
	public int deleteReview(
			@Param("id") int id);
	
	public int selectCountReviewPointByMovieId(
			@Param("movieId") int movieId);
	
	public int selectCountReviewByMovieId(
			@Param("movieId") int movieId);
}
