package com.bogus.bogusplus.tmdb;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;

import com.bogus.bogusplus.tmdb.model.TMDB;

public class TmdbAPI {

	public List<TMDB> getInfoList(String type) {
		int pages = getPages(type);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = "0001-01-01";

		List<TMDB> infoList = null;
		List<Integer> genreList = null;
        
		try {

			infoList = new ArrayList<TMDB>();

			// 페이지 마다 루프를 돌며 값 추출 및 저장
			for (int i = 1; i <= pages; i++) {
				String apiURL = "https://api.themoviedb.org/3/discover/" + type + "?api_key=" + KEY
						+ "&with_watch_providers=337&watch_region=KR&language=ko&page=" + i;
				URL url = new URL(apiURL);

				BufferedReader bf;

				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

				result = bf.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONArray list = (JSONArray) jsonObject.get("results");

				for (int j = 0; j < list.size(); j++) {
					TMDB tmdb = new TMDB();
					JSONObject contents = (JSONObject) list.get(j);

					tmdb.setContents_num(Integer.parseInt(String.valueOf(contents.get("id"))));
					tmdb.setContents_type(type);
					tmdb.setOverview(contents.get("overview").toString());
					tmdb.setVote_average(Float.parseFloat(String.valueOf(contents.get("vote_average"))));
					tmdb.setPopularity(Float.parseFloat(String.valueOf(contents.get("popularity"))));
                    
					// 컨텐츠 타입(영화/시리즈)에 따라서 파싱 방법 다르게 설정
					if (type.equals("movie")) {
                    
						// 시리즈일 경우 release_date를 key로 데이터 파싱
						if (contents.get("release_date") == null || contents.get("release_date").equals("")) {
							vo.setRelease_date(dateFormat.parse(date));
						} else {
							Date release_date = dateFormat.parse((String) contents.get("release_date"));
							vo.setRelease_date(release_date);
						}
						vo.setTitle(contents.get("title").toString());
					} else if (type.equals("tv")) {
                    
						// 시리즈일 경우 first_air_date를 key로 데이터 파싱
						if (contents.get("first_air_date") == null || contents.get("first_air_date").equals("")) {
							vo.setRelease_date(dateFormat.parse(date));
						} else {
							Date first_air_date = dateFormat.parse((String) contents.get("first_air_date"));
							vo.setRelease_date(first_air_date);
						}
                        
						// 시리즈일 경우 title이 아닌 name을 key로 데이터 파싱
						vo.setTitle(contents.get("name").toString());
					}
					if (contents.get("poster_path") == null || contents.get("poster_path").toString().equals("")) {
						vo.setPoster_path("");
					} else {
						vo.setPoster_path(contents.get("poster_path").toString());
					}

					// 장르 id를 List<integer> 형태로 저장 → 장르 비교를 위한 작업
					JSONArray genre_list = (JSONArray) contents.get("genre_ids");
                    genreList = new ArrayList<Integer>();
					for (int k = 0; k < genre_list.size(); k++) {
						genreList.add(Integer.parseInt(String.valueOf(genre_list.get(k))));
					}
					vo.setGenres(genreList);
					infoList.add(vo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoList;
		
	}

}
