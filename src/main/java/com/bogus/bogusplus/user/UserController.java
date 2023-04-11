package com.bogus.bogusplus.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
			@RequestParam("email") String email) {
		
		return "user/signup/signupPassword";
	}
	
	@GetMapping("/signup/catalogue/view")
	public String signupCatalogue() {
		
		return "user/signup/signupCatalogue";
	}
	
	@GetMapping("/signup/icon/view")
	public String signupIcon() {
		
		return "user/signup/signupIcon";
	}
	
	@GetMapping("/signup/nickName/view")
	public String signupNickName() {
		
		return "user/signup/signupNickName";
	}
	
	@GetMapping("/signup/pin/view")
	public String signupPin() {
		
		return "user/signup/signupPin";
	}
}
