package com.bogus.bogusplus.suda.model;

import java.util.Date;

import lombok.Data;

@Data
public class Suda {

	private int id;
	private int userId;
	private String mbti;
	private String introduce;
	private String type;
	private Date createdAt;
	private Date updatedAt;
}
