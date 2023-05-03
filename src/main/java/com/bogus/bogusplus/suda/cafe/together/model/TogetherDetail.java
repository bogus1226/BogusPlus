package com.bogus.bogusplus.suda.cafe.together.model;

import lombok.Data;

@Data
public class TogetherDetail {
	private int id;
	private int userId;
	private int cafeId;
	private String nickName;
	private String content;
	private String title;
	private String placeName;
	private String placeAddressX;
	private String placeAddressY;
	private String date;
	private int statusCount;

}
