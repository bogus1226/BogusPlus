package com.bogus.bogusplus.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {

	private int id;
	private String email;
	private String password;
	private int catalogue;
	private String icon;
	private String nickName;
	private int kid;
	private String pin;
	private int manager;
	private Date createdAt;
	private Date updatedAt;
	
}
