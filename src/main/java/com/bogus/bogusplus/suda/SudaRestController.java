package com.bogus.bogusplus.suda;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.suda.bo.SudaBO;
import com.bogus.bogusplus.suda.cafe.bo.CafeBO;
import com.bogus.bogusplus.suda.cafe.model.Cafe;

@RestController
@RequestMapping("/suda")
public class SudaRestController {
	
	@Autowired
	private SudaBO sudaBO;
	
	@Autowired
	private CafeBO cafeBO;

	@GetMapping("/inputInfo")
	public Map<String, String> inputInfo(
			@RequestParam("mbti") String mbti
			, @RequestParam("introduce") String introduce 
			, @RequestParam("type") String type
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = sudaBO.inputInfo(mbti, introduce, type, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/searchInfo")
	public Map<String, Object> searchInfo(@RequestParam("search") String search) {
		
		List<Cafe> searchList = cafeBO.getSearchCafeInfo(search);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(searchList != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		resultMap.put("searchList", searchList);
		
		return resultMap;
	}
	

	

}
