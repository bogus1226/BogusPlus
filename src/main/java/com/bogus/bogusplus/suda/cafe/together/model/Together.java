package com.bogus.bogusplus.suda.cafe.together.model;

import java.util.Date;

import lombok.Data;

@Data
public class Together {
	private int id;
	private int userId;
	private int cafeId;
	private String title;
	private String placeName;
	private String placeAddressX;
	private String placeAddressY;
	private Date date;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
