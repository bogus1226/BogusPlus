package com.bogus.bogusplus.profile;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/profile")
public class ProfileController {

	@GetMapping("/calendar/view")
	public String calendar() {
		

		return "profile/calendar";
	}
	
}
