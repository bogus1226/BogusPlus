package com.bogus.bogusplus.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.movie.bo.MovieBO;
import com.bogus.bogusplus.movie.model.Calendar;
import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@RestController
@RequestMapping("/profile")
public class ProfileRestController {
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/movieInfoList")
	public Map<String, Object> calendar(
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Calendar> recordList = movieBO.getRecordListByUserId(userId);
		
		Map<String, Object> recordMap = new HashMap<>();
		

		recordMap.put("recordList", recordList);

		
		
		return recordMap;
	}
	
	
	@PostMapping("/update")
	public Map<String, String> profileUpdate(
			@RequestParam("nickName") String nickName
			, @RequestParam("catalogue") int catalogue
			, @RequestParam("pin") String pin
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.updateProfile(userId, nickName, catalogue, pin);
		
		User user = userBO.getUserById(userId);
		
		session.setAttribute("userName", user.getNickName());

		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/update/notpin")
	public Map<String, String> profileUpdateNotPin(
			@RequestParam("nickName") String nickName
			, @RequestParam("catalogue") int catalogue
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.updateProfileNotPin(userId, nickName, catalogue);
		
		User user = userBO.getUserById(userId);
		
		session.setAttribute("userName", user.getNickName());
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

}
