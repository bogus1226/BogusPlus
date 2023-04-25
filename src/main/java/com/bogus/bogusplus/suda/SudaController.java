package com.bogus.bogusplus.suda;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.bogusplus.suda.bo.SudaBO;
import com.bogus.bogusplus.suda.cafe.bo.CafeBO;
import com.bogus.bogusplus.suda.cafe.model.Cafe;

@Controller
@RequestMapping("/suda")
public class SudaController {
	
	@Autowired
	private SudaBO sudaBO;
	
	@Autowired
	private CafeBO cafeBO;

	@GetMapping("/inputInfo/view")
	public String inputInfo() {
		
		return "suda/sudaInputInfo";
	}
	
	@GetMapping("/info/isDuplicate")
	public String infoCheck(HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if(sudaBO.infoIsDuplicate(userId)) {
			return "redirect:/suda/mainpage/view";
		} else {
			return "redirect:/suda/inputInfo/view";
		}	
	}
	
	@GetMapping("/mainpage/view")
	public String sudaMainPage(
			HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = cafeBO.isduplicateCafe(userId);
		
		Cafe cafe = cafeBO.getCafeInfo(userId);
		
		model.addAttribute("is_duplicate", count);
		
		
		if(cafe != null) {
			model.addAttribute("name", cafe.getName());
		}
		
		return "suda/sudaMainPage";
	}
}
