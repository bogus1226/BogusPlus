package com.bogus.bogusplus.movie.model;

import lombok.Data;

@Data
public class Record {

	private int id;
	private int movieId;
	private int userId;
	private String createdAt;
	
}
