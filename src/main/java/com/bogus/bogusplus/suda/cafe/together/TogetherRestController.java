package com.bogus.bogusplus.suda.cafe.together;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.suda.cafe.together.bo.TogetherBO;

@RestController
@RequestMapping("/suda/cafe/together")
public class TogetherRestController {
	
	@Autowired
	private TogetherBO togetherBO;

	@PostMapping("/create")
	public Map<String, String> addTogether(
			@RequestParam("cafeId") int cafeId
			, @RequestParam("title") String title
			, @RequestParam("placeName") String placeName
			, @RequestParam("placeAddressX") String placeAddressX
			, @RequestParam("placeAddressY") String placeAddressY
			, @RequestParam("date") @DateTimeFormat(pattern="yy년 MM월 dd일") Date date
			, @RequestParam("content") String content
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = togetherBO.addTogether(userId, cafeId, title, placeName, placeAddressX, placeAddressY, date, content);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/attend")
	public Map<String, String> attendTogether(
			@RequestParam("togetherId") int togetherId
			, HttpSession session ) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = togetherBO.attendTogether(togetherId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/notAttend")
	public Map<String, String> notAttendTogether(
			@RequestParam("togetherId") int togetherId
			, HttpSession session ) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = togetherBO.notAttendTogether(togetherId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
