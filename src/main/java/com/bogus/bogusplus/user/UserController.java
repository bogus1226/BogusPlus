package com.bogus.bogusplus.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String signupPassword() {
		
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
}
