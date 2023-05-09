package com.bogus.bogusplus.movie.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.movie.review.bo.ReviewBO;

@RestController
@RequestMapping("/movie/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/add")
	public Map<String, Object> addReview(
			@RequestParam("movieId") int movieId
			, @RequestParam("content") String content
			, @RequestParam("grade") int grade
			, HttpSession session){
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = reviewBO.addReview(movieId, content, grade, userId);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	@GetMapping("/delete")
	public Map<String, String> deleteReview(
			@RequestParam("reviewId") int reviewId) {
		
		int count = reviewBO.deleteReview(reviewId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
		
	}
	
	

}
