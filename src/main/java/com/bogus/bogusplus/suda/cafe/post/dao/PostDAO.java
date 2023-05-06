package com.bogus.bogusplus.suda.cafe.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.suda.cafe.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("cafeId") int cafeId
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			, @Param("userId") int userId);

	public List<Post> selectPostInfoList(
			@Param("cafeId") int cafeId);
	
	public int deletePost(
			@Param("id") int id);
	
	public Post selecetPostInfo(
			@Param("id") int id); 
	
	public int updatePost(
			@Param("content") String content
			, @Param("imagePath") String imagePath
			, @Param("id") int id);
	
	public int updatePostImageNotChange(
			@Param("content") String content
			, @Param("id") int id);
}
