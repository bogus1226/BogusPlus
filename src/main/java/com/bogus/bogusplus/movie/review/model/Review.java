package com.bogus.bogusplus.movie.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	
	private int id;
	private int movieId;
	private int userId;
	private String content;
	private int grade;
	private Date createdAt;
}
