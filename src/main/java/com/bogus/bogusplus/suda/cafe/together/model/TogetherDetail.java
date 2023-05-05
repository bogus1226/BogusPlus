package com.bogus.bogusplus.suda.cafe.together.model;

import java.util.List;

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
	private String mbti;
	private int statusCount;
	private List<Mypage> myPageList;

}
