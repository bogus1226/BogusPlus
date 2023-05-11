package com.bogus.bogusplus.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.common.EncryptService;
import com.bogus.bogusplus.user.dao.UserDAO;
import com.bogus.bogusplus.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public User signin(String email, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.selectCountSignin(email, encryptPassword);
	}
	
	public String encryptPassword(String password) {
		String encryptPassword = EncryptService.md5(password);
		
		return encryptPassword;
	}
	
	public int addUser(User user) {
		
		return userDAO.insertUser(user);
	}
	
	public int addCatalogue(int catalogue, int userId) {
		
		return userDAO.updateCatalogue(catalogue, userId);
	}
	
	public int addIcon(String icon, int userId) {
		
		return userDAO.updateIcon(icon, userId);
	}
	
	public int addNickName(String nickName, int kid, int userId) {
		
		return userDAO.updateNickName(nickName, kid, userId);
	}
	
	public int addPin(String pin, int userId) {
		
		String encryptPin = EncryptService.md5(pin);
		
		return userDAO.updatePin(encryptPin, userId);
		
	}
	
	public boolean EmailIsDuplicate(String email) {
		
		int count = userDAO.selectCountIsDuplicate(email);
		
		return count != 0;
	}
	
	public User getUserById(int userId) {
		
		return userDAO.selectUserById(userId);
	}
	
	public int updateProfile(
			int userId
			, String nickName
			, int catalogue
			, String pin) {
		
		String encryptPin = EncryptService.md5(pin);
		
		return userDAO.updateProfile(userId, nickName, catalogue, encryptPin);
	}
	
	public int updateProfileNotPin(
			int userId
			, String nickName
			, int catalogue) {
		
		return userDAO.updateProfileNotPin(userId, nickName, catalogue);
	}
	
	public int deletePin(int userId) {
		
		return userDAO.updatePinNull(userId);
	}

}
