package com.bogus.bogusplus.suda.cafe.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cafe {
	private int id;
	private int userId;
	private String name;
	private Date createdAt;
	private Date updatedAt;
}
