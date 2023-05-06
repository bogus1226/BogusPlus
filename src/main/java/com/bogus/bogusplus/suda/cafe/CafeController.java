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
import com.bogus.bogusplus.suda.cafe.post.model.Post;
import com.bogus.bogusplus.suda.cafe.post.model.PostDetail;
import com.bogus.bogusplus.suda.cafe.together.bo.TogetherBO;
import com.bogus.bogusplus.suda.cafe.together.model.TogetherDetail;


@Controller
@RequestMapping("/suda/cafe")
public class CafeController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CafeBO cafeBO;
	
	@Autowired
	private TogetherBO togetherBO;
	
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
			, Model model) {
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeUpLoad";
	}
	
	@GetMapping("/upload/together/view")
	public String cafeUploadTogether(
			@RequestParam("cafeId") int cafeId
			, Model model) {
		
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeUploadTogether";
	}
	
	@GetMapping("/together/view")
	public String cafeTogetherPage(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<TogetherDetail> togetherList = togetherBO.getTogetherList(userId, cafeId);
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		if(togetherList != null) {
			model.addAttribute("togetherList", togetherList);
		}
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("userId", userId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeTogetherPage";
	}
	
	@GetMapping("/waiting/view")
	public String cafeTogetherWatingPage(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<TogetherDetail> togetherList = togetherBO.getTogetherWatingList(userId, cafeId);
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		if(togetherList != null) {
			model.addAttribute("togetherList", togetherList);
		}
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("userId", userId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeTogetherWatingPage";
	}
	
	@GetMapping("/mypage/view")
	public String cafeTogetherMyPage(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<TogetherDetail> togetherList = togetherBO.getTogetherMyPageList(userId, cafeId);
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		if(togetherList != null) {
			model.addAttribute("togetherList", togetherList);
		}
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("userId", userId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeTogetherMyPage";
	}
	
	@GetMapping("/attend/view")
	public String cafeTogetherAttendPage(
			@RequestParam("cafeId") int cafeId
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<TogetherDetail> togetherList = togetherBO.getTogetherAttendList(userId, cafeId);
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		if(togetherList != null) {
			model.addAttribute("togetherList", togetherList);
		}
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("userId", userId);
		model.addAttribute("cafe", cafe);
		
		return "suda/cafe/cafeTogetherAttendPage";
	}
	
	@GetMapping("/update/view")
	public String cafePostUpdate(
			@RequestParam("cafeId") int cafeId
			, @RequestParam("postId") int postId
			, Model model) {
		
		Cafe cafe = cafeBO.getCafeById(cafeId);
		
		Post post = postBO.getPostById(postId);
		
		model.addAttribute("cafeId", cafeId);
		model.addAttribute("cafe", cafe);
		model.addAttribute("post", post);
		
		return "suda/cafe/cafeUpdatePage";
	}
}
