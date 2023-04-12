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
	
	public boolean EmailIsDuplicate(String email) {
		
		int count = userDAO.selectCountIsDuplicate(email);
		
		return count != 0;
	}
	
	public User getLastUser() {
		 
		return userDAO.selectLastUser();
	}
	
	public int updatePin(String pin, int userId) {
		
		String encryptPin = EncryptService.md5(pin);
		
		return userDAO.updatePin(encryptPin, userId);
		
		
	}
}
