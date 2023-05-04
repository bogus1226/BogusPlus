package com.bogus.bogusplus.suda.cafe.together.model;

import java.util.Date;

import lombok.Data;

@Data
public class Status {

	private int id;
	private int userId;
	private int togetherId;
	private int status;
	private Date createdAt;
	private Date updatedAt;
}
