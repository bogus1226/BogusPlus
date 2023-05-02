package com.bogus.bogusplus.suda.cafe.together;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
			, @RequestParam("date") String date
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
}
