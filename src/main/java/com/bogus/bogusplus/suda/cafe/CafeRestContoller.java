package com.bogus.bogusplus.suda.cafe;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.suda.cafe.bo.CafeBO;

@RestController
@RequestMapping("/suda/cafe")
public class CafeRestContoller {
	
	@Autowired
	private CafeBO cafeBO;

	@GetMapping("/create")
	public Map<String, String> addCafe(
			@RequestParam("name") String name
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = cafeBO.addCafe(name, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	

	
	
}
