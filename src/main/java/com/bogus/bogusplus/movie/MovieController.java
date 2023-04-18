package com.bogus.bogusplus.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.bogusplus.tmdb.bo.TmdbBO;
import com.bogus.bogusplus.tmdb.model.TMDB;

@Service
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private TmdbBO tmdbBO;

	@GetMapping("/mainpage/view")
	public String movieMaingPage(Model model) {
		
		List<TMDB> mainPagePopularPosterList = tmdbBO.getMainPagePopularPosterList();
		
		List<TMDB> mainpageKoreaMovieList = tmdbBO.getMainPageKoreaMovieList();
		
		model.addAttribute("mainPagePopularPosterList", mainPagePopularPosterList);
		
		model.addAttribute("mainpageKoreaMovieList", mainpageKoreaMovieList);
		
		return "movie/mainPage";
	}
}
