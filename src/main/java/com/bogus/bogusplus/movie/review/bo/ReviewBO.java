package com.bogus.bogusplus.movie.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.movie.review.dao.ReviewDAO;
import com.bogus.bogusplus.movie.review.model.Review;
import com.bogus.bogusplus.movie.review.model.ReviewDetail;
import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private UserBO userBO;

	public int addReview(int movieId, String content, int grade, int userId) {
		
		return reviewDAO.insertReview(movieId, content, grade, userId);
	}
	
	public List<ReviewDetail> getReviewListByMovieId(int movieId) {
		
		List<Review> reviewList = reviewDAO.selectGetReviewListByMovieId(movieId);
		
		List<ReviewDetail> reviewDetailList = new ArrayList<>();
		
		for(Review review:reviewList) {
			ReviewDetail reviewDetail = new ReviewDetail();
			User userNickName = userBO.getUserById(review.getUserId()); 
			reviewDetail.setContent(review.getContent());
			reviewDetail.setDate(review.getCreatedAt());
			reviewDetail.setGrade(review.getGrade());
			reviewDetail.setNickName(userNickName.getNickName());
			reviewDetail.setUserId(review.getUserId());
			reviewDetail.setId(review.getId());
			
			reviewDetailList.add(reviewDetail);
		}
		
		return reviewDetailList;
	}
	
	public boolean isDuplicateReview(int movieId, int userId) {
		
		int count = reviewDAO.selectIsDuplicateReview(movieId, userId);
		
		return count != 0;
	}
	
	public int deleteReview(int reviewId) {
		
		return reviewDAO.deleteReview(reviewId);
	}
	
	public double countReviewGrade(int movieId) {
		
		Integer totalNumber = reviewDAO.selectCountReviewByMovieId(movieId);
		
		
		if(totalNumber != 0) {
			Integer totalScore = reviewDAO.selectCountReviewPointByMovieId(movieId);
			double average = totalScore / (double)totalNumber;
			
			// Math.round를 이용해서 반올림을해준다 
			// ex 6.499999 에서 10을곱한후 (64.9999) 
			// Math.round 에서 소수 첫번째 숫자가 5보다작으면 소수점을 그냥없애고
			// 5와같거나 5보다크면 정수에 1을 더해준후 소수점을 없앤다!!
			// 그리고 다시 10으로나눠준다!
			double roundedAverage = Math.round(average * 10.0) / 10.0;
			
			return roundedAverage;
		}
		
		
		return totalNumber;	
	}
}
