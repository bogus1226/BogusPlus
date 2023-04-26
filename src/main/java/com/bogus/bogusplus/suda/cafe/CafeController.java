package com.bogus.bogusplus.suda.cafe;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusplus.suda.cafe.bo.CafeBO;
import com.bogus.bogusplus.suda.cafe.model.Cafe;
import com.bogus.bogusplus.suda.cafe.post.bo.PostBO;
import com.bogus.bogusplus.suda.cafe.post.model.PostDetail;


@Controller
@RequestMapping("/suda/cafe")
public class CafeController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CafeBO cafeBO;
	
	@GetMapping("/mainpage/view")
	public String cafeMainPage(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		List<PostDetail> postDetail = postBO.getPostDetailInfo(cafeId);
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		if(postDetail != null) {
			model.addAttribute("postDetail", postDetail);
		}
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("userId", userId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeMainPage";
	}
	
	@GetMapping("/upload/view")
	public String cafeUpLoad(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeUpLoad";
	}

}
