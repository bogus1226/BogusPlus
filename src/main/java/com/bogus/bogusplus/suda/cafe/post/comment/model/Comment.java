package com.bogus.bogusplus.suda.cafe.post.comment.model;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {

	private int id;
	private int postId;
	private int userId;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
	private String nickName;
}
