package com.bogus.bogusplus.suda.cafe.together.bogustalk;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.suda.cafe.together.bogustalk.bo.BogusTalkBO;

@RestController
@RequestMapping("/suda/cafe/together")
public class BogusTalkRestController {
	
	@Autowired
	private BogusTalkBO bogusTalkBO;

	@GetMapping("/talk")
	public Map<String, String> addTalk(
			@RequestParam("togetherId") int togetherId
			,@RequestParam("talk") String talk
			, HttpSession session){
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = bogusTalkBO.addTalk(togetherId, userId, talk);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
