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
	
	public String encryptPassword(String password) {
		String encryptPassword = EncryptService.md5(password);
		
		return encryptPassword;
	}
	
	public int addUser(User user) {
		
		return userDAO.insertUser(user);
	}
	
	public int addCatalogue(String catalogue, int userId) {
		
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
	

}
