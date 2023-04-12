package com.bogus.bogusplus.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(User user);
	
	public int updateCatalogue(
			@Param("catalogue") String catalogue
			, @Param("id") int id);

	public int selectCountIsDuplicate(@Param("email") String email);
	
	public User selectLastUser();
	
	public int updatePin(
			@Param("pin") String pin
			,@Param("userId") int userId);
}
