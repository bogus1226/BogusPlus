package com.bogus.bogusplus.suda.cafe.post.model;

import java.util.List;

import com.bogus.bogusplus.suda.cafe.post.comment.model.Comment;

import lombok.Data;

@Data
public class PostDetail {

	private int id;
	private int userId;
	private String nickName;
	private String content;
	private String imagePath;
	private List<Comment> commentList;
	
}
