package com.bogus.bogusplus.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("email") String email
			, @Param("password") String password
			, @Param("catalogue") int catalogue
			, @Param("icon") String icon
			, @Param("nickName") String nickName
			, @Param("kid") int kid);

	public int selectCountIsDuplicate(@Param("email") String email);
	
	public User selectLastUser();
	
	public int updatePin(
			@Param("pin") String pin
			,@Param("userId") int userId);
}
