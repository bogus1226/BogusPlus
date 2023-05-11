package com.bogus.bogusplus.profile;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.bogusplus.profile.bo.ProfileBO;
import com.bogus.bogusplus.user.model.User;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;

	@GetMapping("/calendar/view")
	public String calendar() {
		

		return "profile/calendar";
	}
	
	@GetMapping("/update/view")
	public String prifileUpdate(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		User user = profileBO.getUserInfo(userId);
		
		model.addAttribute("user", user);
		
		return "profile/update";
	}
}
