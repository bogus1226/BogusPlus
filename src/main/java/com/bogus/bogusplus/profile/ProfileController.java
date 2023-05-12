package com.bogus.bogusplus.profile;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.bogusplus.profile.bo.ProfileBO;
import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/calendar/view")
	public String calendar() {
		

		return "profile/calendar";
	}
	
	@GetMapping("/update/view")
	public String profileUpdate(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		User user = profileBO.getUserInfo(userId);
		
		model.addAttribute("user", user);
		
		return "profile/update";
	}
	
	@GetMapping("/connect/view")
	public String profilePinConnect(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserById(userId);
		
		model.addAttribute("user", user);
		return "profile/connect";
	}
}
