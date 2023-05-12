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
	
	public User selectUserById(@Param("id") int id);
	
	public int updateProfile(
			@Param("id") int id
			, @Param("nickName") String nickName
			, @Param("catalogue") int catalogue
			, @Param("pin") String pin);
	
	public int updateProfileNotPin(
			@Param("id") int id
			, @Param("nickName") String nickName
			, @Param("catalogue") int catalogue);
	
	public int updatePinNull(@Param("id") int id);
	
	public int selectIsDuplicatePin(
			@Param("id") int id
			, @Param("pin") String pin);
	
}
