package com.bogus.bogusplus.suda.bo;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.suda.cafe.bo.CafeBO;
import com.bogus.bogusplus.suda.cafe.model.Cafe;
import com.bogus.bogusplus.suda.dao.SudaDAO;
import com.bogus.bogusplus.suda.model.Suda;
import com.bogus.bogusplus.suda.model.TotalCount;

@Service
public class SudaBO {
	
	@Autowired
	private SudaDAO sudaDAO;
	
	@Autowired
	private CafeBO cafeBO;

	public int inputInfo(String mbti, String introduce, String type, int userId) {
		
		return sudaDAO.inputInfo(mbti, introduce, type, userId);
	}
	
	public Boolean infoIsDuplicate(int userId) {
		
		int count = sudaDAO.infoIsDuplicate(userId);
		
		return count!=0;
	}
	
	public Suda getSudaByUserId(int userId) {
	
		return sudaDAO.selectSudaByUserId(userId);
	}
	
	public List<Cafe> popularCounting() {
		
		List<TotalCount> togetherCoutList = sudaDAO.togetherCountList();
		List<TotalCount> postCoutList = sudaDAO.postCountList();
		
		List<TotalCount> popularList = new ArrayList<>();
		
		for(TotalCount togethercount:togetherCoutList) {
			TotalCount totalcount = new TotalCount();
			for(TotalCount postcount:postCoutList) {
				if(togethercount.getCafeId() == postcount.getCafeId()) {
					
					totalcount.setCafeId(postcount.getCafeId());
					totalcount.setTotal(togethercount.getTotal() + postcount.getTotal());
					
					popularList.add(totalcount);
					continue;
				} else {
					
				}
			}	
		}
		
		List<TotalCount> sortedPopularList = popularList.stream()
			    .sorted(Comparator.comparingInt(TotalCount::getTotal).reversed())
			    .collect(Collectors.toList());
		
		if(sortedPopularList.size() > 3) {
			sortedPopularList = sortedPopularList.subList(0, 3);
		}
		
		List<Cafe> cafeList = new ArrayList<>();
		for(TotalCount totalcount:sortedPopularList) {
			Cafe cafe = new Cafe();
			Cafe cafeInfo = cafeBO.getCafeById(totalcount.getCafeId());
			cafe.setName(cafeInfo.getName());
			cafe.setId(cafeInfo.getId());
			cafe.setUserId(cafeInfo.getUserId());
			cafe.setCreatedAt(cafeInfo.getCreatedAt());
			cafe.setUpdatedAt(cafeInfo.getUpdatedAt());
			
			cafeList.add(cafe);
		}
			
			
		return cafeList;
	
	}
}
