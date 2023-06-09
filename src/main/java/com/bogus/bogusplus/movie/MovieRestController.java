package com.bogus.bogusplus.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusplus.movie.bo.MovieBO;
import com.bogus.bogusplus.tmdb.bo.TmdbBO;
import com.bogus.bogusplus.tmdb.model.TMDB;

@RestController
@RequestMapping("/movie")
public class MovieRestController {

	@Autowired
	TmdbBO tmdbBO;
	
	@Autowired
	MovieBO movieBO;
	
	@GetMapping("/nextList")
	public Map<String, Object> nextMovieList(
			@RequestParam("click") int click
			, @RequestParam("movieInfo") String movieInfo) {
		
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
	
	@GetMapping("/searchMovie")
	public Map<String, Object> searchMovieList(
			@RequestParam("search") String search) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<TMDB> searchMovieList = tmdbBO.getSearchMovie(search);
		
		if(searchMovieList != null) {
			resultMap.put("result", "success");
		} else  {
			resultMap.put("result", "fail");
		}
		
		resultMap.put("searchMovieList", searchMovieList);
		
		return resultMap;
	}
	
	@GetMapping("/interest/add")
	public Map<String, Object> addInterest(
			@RequestParam("movieId") int movieId
			, @RequestParam("posterPath") String posterPath
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		int count = movieBO.addInterest(movieId, userId, posterPath);
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	
	@GetMapping("/interest/delete")
	public Map<String, Object> deleteInterest(
			@RequestParam("movieId") int movieId
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		int count = movieBO.deleteInterest(movieId, userId);
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	@GetMapping("/record") 
	public Map<String, Object> addRecord(
			@RequestParam("movieId") int movieId
			, @RequestParam("movieName") String movieName
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		int count = movieBO.addRecord(userId, movieId, movieName);
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	@GetMapping("/list") 
	public Map<String, Object> movieList(
			@RequestParam("movieSelectNumber") int movieSelectNumber) {
		
		Map<String, Object> movieMap = new HashMap<>();
		
		List<TMDB> movieList = new ArrayList<>();
		
		String[] genresNumber = {"0", "1", "16", "28,53", "35", "10749", "878", "27"
				, "10751", "12", "14" ,"10752", "10402", "80", "99", "36"};
		
		if(movieSelectNumber == 0) {
			movieList = tmdbBO.getMainPageKoreaMovieList();
		} else if(movieSelectNumber == 1) {
			movieList = tmdbBO.getMainPageTodayTopMovieList();
		} else {
			movieList = tmdbBO.getMainPageGenresMovieList(genresNumber[movieSelectNumber]);
		} 
		
		movieMap.put("movieList", movieList);
		
		return movieMap;
	}
	

	
	
}
