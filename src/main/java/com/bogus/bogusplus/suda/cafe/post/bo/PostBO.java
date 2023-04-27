package com.bogus.bogusplus.suda.cafe.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusplus.common.FileManagerService;
import com.bogus.bogusplus.suda.cafe.post.comment.bo.CommentBO;
import com.bogus.bogusplus.suda.cafe.post.comment.model.Comment;
import com.bogus.bogusplus.suda.cafe.post.dao.PostDAO;
import com.bogus.bogusplus.suda.cafe.post.model.Post;
import com.bogus.bogusplus.suda.cafe.post.model.PostDetail;
import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public int addPost(int cafeId, String content, MultipartFile file, int userId) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(cafeId, content, imagePath, userId);
	}

	public List<PostDetail> getPostDetailInfo(int cafeId){
		
		List<Post> postList = postDAO.selectPostInfoList(cafeId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			for(Comment comment:commentList) {
				User userNickName = userBO.getUserById(comment.getUserId()); 
				comment.setNickName(userNickName.getNickName());
			}
			
			postDetail.setUserId(post.getUserId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setId(post.getId());
			postDetail.setNickName(user.getNickName());
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
	}
	
	public int deletePost(int postId) {
		
		Post post = postDAO.selecetPostInfo(postId);
		
		if(post.getImagePath() != null) {
			FileManagerService.removeFile(post.getImagePath());
		}
			
		commentBO.commentDeleteByPostId(postId);
		
		return postDAO.deletePost(postId);
	}
	

	
}
