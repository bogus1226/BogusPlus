package com.bogus.bogusplus.movie.model;

import java.util.Date;

import lombok.Data;

@Data
public class Record {

	private int id;
	private int movieId;
	private int userId;
	private String movieName;
	private Date createdAt;
	
}
