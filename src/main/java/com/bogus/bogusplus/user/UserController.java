package com.bogus.bogusplus.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

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
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, Model model) {
		
		String encryptPassword = userBO.encryptPassword(password);
		
		model.addAttribute("email", email);
		model.addAttribute("password", encryptPassword);
		
		return "user/signup/signupCatalogue";
	}
	
	@PostMapping("/signup/icon/view")
	public String signupIcon(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, @RequestParam("catalogue") int catalogue
			, Model model) {
		
		model.addAttribute("email", email);
		model.addAttribute("password", password);
		model.addAttribute("catalogue", catalogue);
		
		return "user/signup/signupIcon";
	}
	
	@PostMapping("/signup/nickName/view")
	public String signupNickName(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, @RequestParam("catalogue") int catalogue
			, @RequestParam("icon") String icon
			, Model model) {
		
		model.addAttribute("email", email);
		model.addAttribute("password", password);
		model.addAttribute("catalogue", catalogue);
		model.addAttribute("icon", icon);
		
		return "user/signup/signupNickName";
	}
	
	@GetMapping("/signup/pin/view")
	public String signupPin(Model model) {
		
		User lastUser = userBO.getLastUser();
		
		model.addAttribute("user", lastUser);
		
		return "user/signup/signupPin";
	}
	

}
