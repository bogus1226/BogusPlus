package com.bogus.bogusplus.tmdb.bo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.tmdb.model.TMDB;

@Service
public class TmdbBO {
	
	// json에 출력되는 언어 한국어
	String language = "ko-KR";
	
	// TMDB 키 값
	String key = "b878289678c05cf71128b06a698cc177";
	
	// 디즈니 플러스 값
	int provider = 337;
	
	
	// 공통코드안의 공통코드!
	// url 입력했을때나오는 results 값 가져오는 코드
	// list값 가져오는 코드
	public JSONArray tmdbCalculator(String apiURL) throws UnsupportedEncodingException, IOException, ParseException  {
		
		URL url = new URL(apiURL);
		
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		
		String result = bf.readLine();
		
		JSONParser jsonParser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);		
		
		JSONArray list = (JSONArray) jsonObject.get("results");
		
		return list;
	}
	
	
	// 공통적인코드내용을 하나로 묶었다!
	// TMDB 오픈 API URL 기준으로 값을 가져오는 코드!
	// infoList 값 가져오는 코드
	public List<TMDB> apiGetTMDBInfo(String plusURL, int page) {
		
		List<TMDB> infoList = null;
		
		try {
			
			infoList = new ArrayList<TMDB>();
				
			String apiURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
					+ "&language=" + language + "&page=" + page + "&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&"
					+ plusURL;	
			
			JSONArray list = tmdbCalculator(apiURL);
			
			int countList = list.size();


			for(int i = 0; i < countList; i++) {
				TMDB tmdb = new TMDB();
				JSONObject contents = (JSONObject) list.get(i);
				
				String poster_path = String.valueOf(contents.get("poster_path"));
				Integer movieId = Integer.parseInt(String.valueOf(contents.get("id"))); 
		
				tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
				
				tmdb.setId(movieId);
				
				infoList.add(tmdb);
			}		

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return infoList;
		
	}
	
	public List<TMDB> getMainPagePopularPosterList() {

		List<TMDB> infoList = null;
        
		try {

			infoList = new ArrayList<TMDB>();
			
			String apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=" + key
					+ "&with_watch_providers=" + provider + "&watch_region=KR&sort_by=release_date.desc" 
					+ "&language=" + language;
			
			JSONArray list = tmdbCalculator(apiURL);

			for (int i = 0; i < 10; i++) {
				TMDB tmdb = new TMDB();
				JSONObject contents = (JSONObject) list.get(i);

				String backdrop_path = String.valueOf(contents.get("backdrop_path"));
				tmdb.setBackdrop_path("https://image.tmdb.org/t/p/w1280/" + backdrop_path);
				tmdb.setTitle(String.valueOf(contents.get("title")));	
				tmdb.setOverview(String.valueOf(contents.get("overview")));
				infoList.add(tmdb);
			}
			
			
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return infoList;
	}
	
	// 한국영화
	public List<TMDB> getMainPageKoreaMovieList() {

		List<TMDB> infoList = apiGetTMDBInfo("with_original_language=ko", 1);
		
		return infoList;
	}
	
	
	// 오늘의 TOP 영화
	public List<TMDB> getMainPageTodayTopMovieList() {

		List<TMDB> infoList = apiGetTMDBInfo(null, 1);
		
		return infoList;
	}
	
	// 장르별 영화
	public List<TMDB> getMainPageGenresMovieList(String genres) {

		List<TMDB> infoList = apiGetTMDBInfo("with_genres=" + genres, 1);
		
		return infoList;
	}
	
	
	// 버튼 클릭시 데이터 20개 추가로 가져오기
	public List<TMDB> getClickNextInfo(int click, String movieInfo) {
		
		click+=1;
		
		List<TMDB> infoList = null;
		
		if(movieInfo.equals("0")|| movieInfo.equals("1")) {
			infoList = apiGetTMDBInfo("with_original_language=ko", click);
		} else if(movieInfo.equals("2")) {
			infoList = apiGetTMDBInfo(null, click);
		} else {
			infoList = apiGetTMDBInfo("with_genres=" + movieInfo, click);
		}
		
		return infoList;
	}

	public List<TMDB> getSearchMovie(String search) {
		
		List<TMDB> infoList = null;
		
		try {
			
			infoList = new ArrayList<TMDB>();
				
			String apiURL = "https://api.themoviedb.org/3/search/movie?api_key=" + key
					+ "&language=" + language + "&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&query=" + search;	
			
			JSONArray list = tmdbCalculator(apiURL);
			
			int countList = list.size();


			for(int i = 0; i < countList; i++) {
				TMDB tmdb = new TMDB();
				JSONObject contents = (JSONObject) list.get(i);
				
				String poster_path = String.valueOf(contents.get("poster_path"));
				tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
				infoList.add(tmdb);
			}		

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return infoList;
	}

	
	public TMDB movieDetailTMDBInfoByMovieId(int movieId) {
		
		TMDB movieInfo = null;
		
		try {
			
			movieInfo = new TMDB();
				
			String apiURL = "https://api.themoviedb.org/3/movie/"
					+ movieId + "?api_key=" + key + "&language=ko-KR&watch_region=KR&"
					+ "with_watch_providers=" + provider;
			
			URL url = new URL(apiURL);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			String result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);		

			String backdrop_path = String.valueOf(jsonObject.get("backdrop_path"));
			String title = String.valueOf(jsonObject.get("title"));
			Boolean adult = (Boolean) jsonObject.get("adult");
			String release_date = String.valueOf(jsonObject.get("release_date"));
			
			// TMDB자체에서 명확하게 List<Object>이기때문에 그대로 놔뒀다!!
			List<Object> genres = (List<Object>) jsonObject.get("genres");
			
			String overview = String.valueOf(jsonObject.get("overview"));
			
			movieInfo.setBackdrop_path("https://image.tmdb.org/t/p/w1280/" + backdrop_path);
			movieInfo.setTitle(title);
			movieInfo.setAdult(adult);
			movieInfo.setRelease_date(release_date);
			movieInfo.setGenres(genres);
			movieInfo.setOverview(overview);
			
				

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return movieInfo;
		
	}
	


}