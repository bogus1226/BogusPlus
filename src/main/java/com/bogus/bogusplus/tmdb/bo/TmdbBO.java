package com.bogus.bogusplus.tmdb.bo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.tmdb.model.TMDB;

@Service
public class TmdbBO {
	
	// json에 출력되는 언어 한국어
	String language = "ko-KR";
	
	// TMDB 키 값
	String key = "b878289678c05cf71128b06a698cc177";
	
	int provider = 337;
	
	public List<TMDB> getMainPagePopularPosterList() {
		
		String result = "";

		List<TMDB> infoList = null;
        
		try {

			infoList = new ArrayList<TMDB>();
			
			

			String apiURL = "https://api.themoviedb.org/3/movie/popular?api_key=" + key
					+ "&with_watch_providers=" + provider + "&watch_region=KR&sort_by=release_date.desc" 
					+ "&language=" + language;
			
			URL url = new URL(apiURL);

			BufferedReader bf;

			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			result = bf.readLine();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("results");

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
	
	// 다음버튼 누를시 영화 7개 추가 되게끔 테스트중
	public List<TMDB> getMainPageKoreaMovieList(Integer click) {
		
		String result = "";

		List<TMDB> infoList = null;
		
		int countList = 0;
		
		int page = 1;
        
		int count = 8;
		
		int pageUpCount = 20;
		
		if(click != null) {
			
			count+=7;
			
			if((count - pageUpCount) > 0) {
				
			} else if (count > pageUpCount) {	
				page++;
				pageUpCount+=20;
			}

		}
		
		
		try {
			
			infoList = new ArrayList<TMDB>();
				
			String apiURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
					+ "&language=" + language + "&page=" + page + "&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&"
					+ "with_original_language=ko";
			
			URL url = new URL(apiURL);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);		
			
			JSONArray list = (JSONArray) jsonObject.get("results");
			
			countList = list.size();
			
			if(click != null) {
					
				
					for(int i = 0; i < count; i++) {
						TMDB tmdb = new TMDB();
						JSONObject contents = (JSONObject) list.get(i);
						
						String poster_path = String.valueOf(contents.get("poster_path"));
						tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
						infoList.add(tmdb);
					}		
					
				} 	

			
			if(countList > 8) {
				for(int i = 0; i < count; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
				
				
			} else {
				for(int i = 0; i < countList; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
			}	

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return infoList;
	}
	
	public List<TMDB> getMainPageTodayTopMovieList() {
		
		String result = "";

		List<TMDB> infoList = null;
		
		int countList = 0;
        
		try {
			
			infoList = new ArrayList<TMDB>();
				
			String apiURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
					+ "&language=" + language + "&page=1&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&";
			
			URL url = new URL(apiURL);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);		
			
			JSONArray list = (JSONArray) jsonObject.get("results");
			
			countList = list.size();
			
			if(countList > 8) {
				for(int i = 0; i < 8; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
				
				
			} else {
				for(int i = 0; i < countList; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
			}	

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return infoList;
	}
	
	public List<TMDB> getMainPageGenresMovieList(String genres) {
		
		String result = "";

		List<TMDB> infoList = null;
		
		int countList = 0;
        
		try {
			
			infoList = new ArrayList<TMDB>();
			String apiURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
					+ "&language=" + language + "&page=1&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&with_genres=" + genres;
			
			URL url = new URL(apiURL);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);		
			
			JSONArray list = (JSONArray) jsonObject.get("results");
			
			countList = list.size();
			
			if(countList > 8) {
				for(int i = 0; i < 8; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
				
				
			} else {
				for(int i = 0; i < countList; i++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(i);
					
					String poster_path = String.valueOf(contents.get("poster_path"));
					tmdb.setPoster_path("https://image.tmdb.org/t/p/w342/" + poster_path);
					infoList.add(tmdb);
				}		
			}	

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return infoList;
	}
	
	


}