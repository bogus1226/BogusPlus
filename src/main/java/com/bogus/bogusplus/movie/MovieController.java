package com.bogus.bogusplus.movie;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusplus.movie.bo.MovieBO;
import com.bogus.bogusplus.movie.model.Interest;
import com.bogus.bogusplus.movie.review.bo.ReviewBO;
import com.bogus.bogusplus.movie.review.model.ReviewDetail;
import com.bogus.bogusplus.tmdb.bo.TmdbBO;
import com.bogus.bogusplus.tmdb.model.Credits;
import com.bogus.bogusplus.tmdb.model.TMDB;
import com.bogus.bogusplus.tmdb.model.TMDBMovieId;

@Service
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private TmdbBO tmdbBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private MovieBO movieBO;

	@GetMapping("/mainpage/view")
	public String movieMaingPage(
			Model model
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Interest> interestList = movieBO.getMovieInterest(userId);
		
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
		
		model.addAttribute("interestList", interestList);
		
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
			, HttpSession session
			, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		TMDBMovieId tmdbMovieId = tmdbBO.movieGetVideoIdByMovieId(movieId);
		
		List<TMDB> recommendList = tmdbBO.getRecommendmovieIdByMovieId(movieId);
		
		List<Credits> creditsList = tmdbBO.getMovieDetailCredits(movieId);
		
		List<ReviewDetail> reviewList = reviewBO.getReviewListByMovieId(movieId);
		
		double reviewAverage = reviewBO.countReviewGrade(movieId);
		
		model.addAttribute("reviewAverage", reviewAverage);
		
		if(recommendList != null) {
			model.addAttribute("recommendList", recommendList);
		}
		
		if(tmdbMovieId.getKey() != null) {
			model.addAttribute("tmdbMovieId", tmdbMovieId);
		}
		
		if(reviewList != null) {
			model.addAttribute("reviewList", reviewList);
		}
		
		model.addAttribute("isDuplicate", reviewBO.isDuplicateReview(movieId, userId));
	
		TMDB tmdb = tmdbBO.movieDetailTMDBInfoByMovieId(movieId);
		
		model.addAttribute("tmdb", tmdb);
		
		model.addAttribute("creditsList", creditsList);
		
		model.addAttribute("movieId", movieId);
		
		model.addAttribute("userId", userId);
		
		model.addAttribute("interestIsDuplicate", movieBO.isDuplicateInterest(movieId, userId));
		
		return "movie/detailRecommend";
	}
	
	@GetMapping("/list/view")
	public String movieList(
			Model model) {
		
		List<TMDB> mainpageKoreaMovieList = tmdbBO.getMainPageKoreaMovieList();
		
		model.addAttribute("mainpageKoreaMovieList", mainpageKoreaMovieList);
		return "movie/movieList";
	}
	
}
