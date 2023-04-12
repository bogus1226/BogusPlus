package com.bogus.bogusplus.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin/email/view")
	public String signinEmail() {
		
		return "user/signin/signinEmail";
	}
	
	@GetMapping("/signin/password/view")
	public String signinPassword() {
		
		return "user/signin/signinPassword";
	}
	
	@GetMapping("/signup/email/view")
	public String signupEmail() {
		
		return "user/signup/signupEmail";
	}
	
	@GetMapping("/signup/password/view")
	public String signupPassword(
			@RequestParam("email") String email
			, Model model) {
		
		model.addAttribute("email", email);
		
		return "user/signup/signupPassword";
	}
	
	@PostMapping("/signup/catalogue/view")
	public String signupCatalogue(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupCatalogue";
	}
	
	@PostMapping("/signup/icon/view")
	public String signupIcon(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
			
		return "user/signup/signupIcon";
	}
	
	@PostMapping("/signup/nickName/view")
	public String signupNickName(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupNickName";
	}
	
	@PostMapping("/signup/pin/view")
	public String signupPin(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupPin";
	}
	

}
