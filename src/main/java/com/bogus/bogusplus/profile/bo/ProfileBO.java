package com.bogus.bogusplus.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.user.bo.UserBO;
import com.bogus.bogusplus.user.model.User;

@Service
public class ProfileBO {

	@Autowired
	private UserBO userBO;
	
	public User getUserInfo(int userId) {
		
		return userBO.getUserById(userId);
	}
}
