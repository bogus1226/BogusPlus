package com.bogus.bogusplus.movie.model;

import java.util.Date;

import lombok.Data;

@Data
public class Interest {
	
	private int id;
	private int movieId;
	private int userId;
	private String posterPath;
	private Date createdAt;
}
