package com.bogus.bogusplus.suda.cafe.together.bogustalk.model;

import java.util.Date;

import lombok.Data;

@Data
public class BogusTalk {

	private int id;
	private int userId;
	private int togetherId;
	private String talk;
	private Date createdAt;
	private String nickName;
}
