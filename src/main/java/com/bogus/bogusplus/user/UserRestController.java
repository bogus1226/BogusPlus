package com.bogus.bogusplus.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@PostMapping("/add/catalogue") 
	public Map<String, String> addCatalogue(
			@RequestParam("catalogue") String catalogue
			, @RequestParam("userId") int userId) {
		
		int count = userBO.addCatalogue(catalogue, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PostMapping("/add/icon") 
	public Map<String, String> addIcon(
			@RequestParam("icon") String icon
			, @RequestParam("userId") int userId) {
		
		int count = userBO.addIcon(icon, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PostMapping("/add/nickName") 
	public Map<String, String> addNickName(
			@RequestParam("nickName") String nickName
			, @RequestParam("kid") int kid
			, @RequestParam("userId") int userId) {
		
		int count = userBO.addNickName(nickName, kid, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PostMapping("/add/pin")
	public Map<String, String> updatePin(
			@RequestParam("pin") String pin
			, @RequestParam("userId") int userId) {
		
		int count = userBO.addPin(pin, userId);
		
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
	

}
