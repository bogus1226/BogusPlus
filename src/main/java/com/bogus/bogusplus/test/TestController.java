package com.bogus.bogusplus.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@GetMapping("/test")
	@ResponseBody
	public String test() {
		
		return "Hello World!!";
	}
	
	@GetMapping("/test/jsp")
	public String jspTest() {
		
		return "test";
	}
}
