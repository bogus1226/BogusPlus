package com.bogus.bogusplus.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		List<TMDB> mainPageTodayTopMovieList = tmdbBO.getMainPageTodayTopMovieList();
		
		List<TMDB> mainPageActionMovieList = tmdbBO.getMainPageGenresMovieList("28,53");
		
		List<TMDB> mainPageAnimationMovieList = tmdbBO.getMainPageGenresMovieList("16");
		
		List<TMDB> mainPageComedyMovieList = tmdbBO.getMainPageGenresMovieList("35");
		
		List<TMDB> mainPageRomanceMovieList = tmdbBO.getMainPageGenresMovieList("10749");
		
		List<TMDB> mainPageSFMovieList = tmdbBO.getMainPageGenresMovieList("878");
		
		List<TMDB> mainPageHorrorMovieList = tmdbBO.getMainPageGenresMovieList("27");
		
		List<TMDB> mainPageFamilyMovieList = tmdbBO.getMainPageGenresMovieList("10751");
		
		List<TMDB> mainPageAdventureMovieList = tmdbBO.getMainPageGenresMovieList("12");
		
		List<TMDB> mainPageFantasyMovieList = tmdbBO.getMainPageGenresMovieList("14");
		
		List<TMDB> mainPageWarMovieList = tmdbBO.getMainPageGenresMovieList("10752");
		
		List<TMDB> mainPageMusicMovieList = tmdbBO.getMainPageGenresMovieList("10402");
		
		List<TMDB> mainPageCrimeMovieList = tmdbBO.getMainPageGenresMovieList("80");
		
		List<TMDB> mainPageDocumentaryMovieList = tmdbBO.getMainPageGenresMovieList("99");
		
		List<TMDB> mainPageHistoryMovieList = tmdbBO.getMainPageGenresMovieList("36");
		
		model.addAttribute("mainPagePopularPosterList", mainPagePopularPosterList);
		
		model.addAttribute("mainpageKoreaMovieList", mainpageKoreaMovieList);
		
		model.addAttribute("mainPageTodayTopMovieList", mainPageTodayTopMovieList);
		
		model.addAttribute("mainPageActionMovieList", mainPageActionMovieList);
		
		model.addAttribute("mainPageAnimationMovieList", mainPageAnimationMovieList);
		
		model.addAttribute("mainPageComedyMovieList", mainPageComedyMovieList);
		
		model.addAttribute("mainPageRomanceMovieList", mainPageRomanceMovieList);
		
		model.addAttribute("mainPageSFMovieList", mainPageSFMovieList);
		
		model.addAttribute("mainPageHorrorMovieList", mainPageHorrorMovieList);
		
		model.addAttribute("mainPageFamilyMovieList", mainPageFamilyMovieList);
		
		model.addAttribute("mainPageAdventureMovieList", mainPageAdventureMovieList);
		
		model.addAttribute("mainPageFantasyMovieList", mainPageFantasyMovieList);
		
		model.addAttribute("mainPageWarMovieList", mainPageWarMovieList);
		
		model.addAttribute("mainPageMusicMovieList", mainPageMusicMovieList);
		
		model.addAttribute("mainPageCrimeMovieList", mainPageCrimeMovieList);
		
		model.addAttribute("mainPageDocumentaryMovieList", mainPageDocumentaryMovieList);
		
		model.addAttribute("mainPageHistoryMovieList", mainPageHistoryMovieList);
		
		return "movie/mainPage";
	}
	
	@GetMapping("/detail/recommend/view")
	public String movieDetailRecommend(
			@RequestParam("movieId") int movieId
			, Model model) {
		
		TMDB tmdb = tmdbBO.movieDetailTMDBInfoByMovieId(movieId);
		
		model.addAttribute("tmdb", tmdb);
		
		return "movie/detailRecommend";
	}
	
}
