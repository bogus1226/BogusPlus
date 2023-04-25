package com.bogus.bogusplus.suda;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/suda")
public class SudaController {

	@GetMapping("/inputInfo/view")
	public String inputInfo() {
		
		return "suda/sudaInputInfo";
	}
}
