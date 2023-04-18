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
					+ "&with_watch_providers=" + provider + "&watch_region=KR&page&sort_by=release_date.desc" 
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
	
	
	public List<TMDB> getMainPageKoreaMovieList() {
		
		String result = "";

		List<TMDB> infoList = null;
        
		try {
			
			infoList = new ArrayList<TMDB>();
				
			String apiURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
					+ "&language=" + language + "&page=" + 1 + "&sort_by=popularity.desc&"
					+ "with_watch_providers=" + provider + "&watch_region=KR&"
					+ "with_original_language=ko";
			
			URL forCountUrl = new URL(apiURL);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(forCountUrl.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			
				
			for(int i = 0; i < 5; i++) {
					
				String apiUpdateURL = "https://api.themoviedb.org/3/discover/movie?api_key=" + key
						+ "&language=" + language + "&page=" + (i + 1) + "&sort_by=popularity.desc&"
						+ "with_watch_providers=" + provider + "&watch_region=KR&"
						+ "with_original_language=ko";
				
				URL url = new URL(apiUpdateURL);
				
				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
				
				result = bf.readLine();
				
				jsonParser = new JSONParser();
				
				jsonObject = (JSONObject) jsonParser.parse(result);
				
				JSONArray list = (JSONArray) jsonObject.get("results");
				
				for(int j = 0; j < 20; j++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(j);
					
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