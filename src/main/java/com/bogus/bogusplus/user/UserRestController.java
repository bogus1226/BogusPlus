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
import com.bogus.bogusplus.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/signup")
	public Map<String, Object> signup(
			@RequestParam("email") String email
			, @RequestParam("password") String password) {
		
		String encryptPassword = userBO.encryptPassword(password);
		
		User user = new User();
		
		user.setEmail(email);
		user.setPassword(encryptPassword);
		
		int count = userBO.addUser(user);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("user", user);
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/add/catalogue") 
	public Map<String, String> addCatalogue(
			@RequestParam("catalogue") String catalogue) {
		
		User user = userBO.getLastUser();
		int userId = user.getId();
		
		int count = userBO.addCatalogue(catalogue, userId);
		
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
