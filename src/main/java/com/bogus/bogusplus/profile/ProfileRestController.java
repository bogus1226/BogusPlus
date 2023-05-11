package com.bogus.bogusplus.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.movie.bo.MovieBO;
import com.bogus.bogusplus.movie.model.Calendar;

@RestController
@RequestMapping("/profile")
public class ProfileRestController {
	
	@Autowired
	private MovieBO movieBO;

	@GetMapping("/movieInfoList")
	public Map<String, Object> calendar(
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Calendar> recordList = movieBO.getRecordListByUserId(userId);
		
		Map<String, Object> recordMap = new HashMap<>();
		

		recordMap.put("recordList", recordList);

		
		
		return recordMap;
	}

}
