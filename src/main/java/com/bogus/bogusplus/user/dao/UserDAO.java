package com.bogus.bogusplus.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusplus.user.model.User;

@Repository
public interface UserDAO {
	
	public User selectCountSignin(
			@Param("email") String email
			, @Param("password") String password);
	
	public int insertUser(User user);
	
	public int updateCatalogue(
			@Param("catalogue") int catalogue
			, @Param("id") int id);
	
	public int updateIcon(
			@Param("icon") String icon
			, @Param("id") int id);
	
	public int updateNickName(
			@Param("nickName") String nickName
			, @Param("kid") int kid
			, @Param("id") int id);
	
	public int updatePin(
			@Param("pin") String pin
			,@Param("id") int id);

	public int selectCountIsDuplicate(@Param("email") String email);
	

}
