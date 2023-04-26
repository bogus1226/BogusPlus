package com.bogus.bogusplus.suda.cafe.post.model;

import java.util.Date;

import lombok.Data;

@Data
public class Post {
	private int id;
	private int userId;
	private int cafeId;
	private String imagePath;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
