package com.bogus.bogusplus.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.tmdb.bo.TmdbBO;
import com.bogus.bogusplus.tmdb.model.TMDB;

@RestController
@RequestMapping("/movie")
public class MovieRestController {

	@Autowired
	TmdbBO tmdbBO;
	
	@GetMapping("/nextList")
	public Map<String, Object> nextMovieList(
			@RequestParam("click") int click
			, @RequestParam("movieInfo") int movieInfo) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<TMDB> nextMovieList = tmdbBO.getClickNextInfo(click, movieInfo);
		
		if(nextMovieList != null) {
			resultMap.put("result", "success");
		} else  {
			resultMap.put("result", "fail");
		}
		
		resultMap.put("nextList", nextMovieList);
		
		return resultMap;
	}
}
