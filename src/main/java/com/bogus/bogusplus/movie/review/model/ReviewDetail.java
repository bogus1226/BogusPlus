package com.bogus.bogusplus.movie.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDetail {
	
	private int id;
	private int userId;
	private String content;
	private int grade;
	private Date date;
	private String nickName;
}
