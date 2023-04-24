package com.bogus.bogusplus.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String signinPassword(
			@RequestParam("email") String email
			, Model model) {
		
		model.addAttribute("email", email);
		
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
	
	@GetMapping("/signup/catalogue/view")
	public String signupCatalogue(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupCatalogue";
	}
	
	@GetMapping("/signup/icon/view")
	public String signupIcon(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
			
		return "user/signup/signupIcon";
	}
	
	@GetMapping("/signup/nickName/view")
	public String signupNickName(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupNickName";
	}
	
	@GetMapping("/signup/pin/view")
	public String signupPin(
			@RequestParam("userId") int userId
			, Model model) {
		
		model.addAttribute("userId", userId);
		
		return "user/signup/signupPin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
        
        session.removeAttribute("userId");
        session.removeAttribute("userName");
        
        return "redirect:/user/signin/email/view"; 
	}
	

}
