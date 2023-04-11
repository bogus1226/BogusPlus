package com.bogus.bogusplus.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, @RequestParam("catalogue") int catalogue
			, @RequestParam("icon") String icon
			, @RequestParam("nickName") String nickName
			, @RequestParam("kid") int kid) {
		
		int count = userBO.addUser(email, password, catalogue, icon, nickName, kid);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/isDuplicate")
	public Map<String, Boolean> emailIsDuplicate(@RequestParam("email") String email) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isDuplicate", userBO.EmailIsDuplicate(email));
		
		return resultMap;
	}
	
	@PostMapping("/pin/update")
	public Map<String, String> updatePin(
			@RequestParam("pin") String pin
			, @RequestParam("userId") int userId) {
		
		int count = userBO.updatePin(pin, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
}
