package com.bogus.bogusplus.suda.cafe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/suda/cafe")
public class CafeController {
	
	@GetMapping("/mainpage/view")
	public String cafeMainPage() {
		
		return "suda/cafe/cafeMainPage";
	}
	
	@GetMapping("/upload/view")
	public String cafeUpLoad() {
		
		return "suda/cafe/cafeUpLoad";
	}

}
