package com.bogus.bogusplus.suda.cafe.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.post.comment.dao.CommentDAO;
import com.bogus.bogusplus.suda.cafe.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;

	public int commentAdd(int userId, int postId, String comment) {
		
		return commentDAO.insertComment(userId, postId, comment);
	}
	
	public List<Comment> getCommentList(int postId) {
		
		return commentDAO.selectCommentList(postId);
	}
}
