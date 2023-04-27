package com.bogus.bogusplus.suda.cafe.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusplus.suda.cafe.post.bo.PostBO;

@RestController
@RequestMapping("/suda/cafe/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@PostMapping("/create")
	public Map<String, String> addPost(
			@RequestParam("cafeId") int cafeId
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(cafeId, content, file, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/delete")
	public Map<String, String> deletePost(
			@RequestParam("postId") int postId) {
		
		int count = postBO.deletePost(postId);
		

		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
