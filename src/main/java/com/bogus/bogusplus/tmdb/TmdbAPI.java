package com.bogus.bogusplus.tmdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.boot.configurationprocessor.json.JSONObject;

import com.bogus.bogusplus.tmdb.model.TMDB;

public class TmdbAPI {

	public List<TMDB> getInfoList(String type) throws UnsupportedEncodingException, IOException {
		
		String key = "b878289678c05cf71128b06a698cc177";    
		
		Integer number = null; 

		String result = "";
		
		String language = "ko-KR";
		
		List<TMDB> infoList = null;
		List<Integer> genreList = null;
		
		URL url = null;
    
		try {
			url = new URL("https://api.themoviedb.org/3/movie/" + number + "?"
					+ "api_key=" + key
					+ "&language=" + language);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		BufferedReader bf;

		if(url != null) {
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
		}
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
		JSONObject movieInfoResult = (JSONObject)jsonObject.get("movieInfoResult");
		JSONObject movieInfo = (JSONObject)movieInfoResult.get("movieInfo");
		
		
	}
		

}
