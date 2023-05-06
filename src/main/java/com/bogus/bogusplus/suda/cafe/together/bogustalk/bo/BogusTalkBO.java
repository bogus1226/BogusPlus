package com.bogus.bogusplus.suda.cafe.together.bogustalk.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.together.bogustalk.dao.BogusTalkDAO;
import com.bogus.bogusplus.suda.cafe.together.bogustalk.model.BogusTalk;

@Service
public class BogusTalkBO {
	
	@Autowired
	private BogusTalkDAO bogusTalkDAO;

	public List<BogusTalk> getBogusTalkListByTogetherId(
			int togetherId) {
		
		return bogusTalkDAO.selectBogusTalkListByTogetherId(togetherId);
	}
	
	public int addTalk(
			int togetherId
			, int userId
			, String talk) {
	
		return bogusTalkDAO.insertTalk(togetherId, userId, talk);
	}
}
