package com.bogus.bogusplus.movie;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
@RequestMapping("/movie")
public class MovieController {

	@GetMapping("/mainpage/view")
	public String movieMaingPage() {
		
		return "movie/mainPage";
	}
}
