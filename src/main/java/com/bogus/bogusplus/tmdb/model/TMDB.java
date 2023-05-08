package com.bogus.bogusplus.tmdb.model;

import java.util.List;

import lombok.Data;

@Data
public class TMDB {

	private boolean adult; // 성인
	private Object backdrop_path; // 배경 경로
	private List<Object> genres; // 장르
	private Object homepage; // 홈페이지
	private Integer id; // 아이디
	private Object imdb_id; // imdb 아이디
	private String original_language; // 원본 언어
	private String original_title; // 원본 제목
	private Object overview; // 개요
	private Double popularity; // 인기
	private String poster_path; // 포스터 경로
	private List<Object> production_countries; // 생산 국가
	private String release_date; // 출시일
	private Object runtime; // 실행 시간
	private List<Object> spoken_languages; // 음성 언어
	private String status; // 상태
	private Object tagline; // 슬로건
	private String title; // 제목
	private Boolean video; // 비디오 유무
	private int vote_average; // 투표 평균
	private Integer vote_count; // 투표수
	
	
	
	
	
	
	
}
