package com.bogus.bogusplus.movie.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.movie.dao.MovieDAO;
import com.bogus.bogusplus.movie.model.Calendar;
import com.bogus.bogusplus.movie.model.Interest;
import com.bogus.bogusplus.movie.model.Record;

@Service
public class MovieBO {

	@Autowired
	private MovieDAO movieDAO;
	
	public int addInterest(int movieId, int userId, String posterPath) {
		
		return movieDAO.insertInterest(movieId, userId, posterPath);
	}
	
	public boolean isDuplicateInterest(int movieId, int userId) {
		int count = movieDAO.selectIsDuplicateInterest(movieId, userId);
		
		return count != 0;
	}
	
	public int deleteInterest(int movieId, int userId) {
		
		return movieDAO.deleteInterest(movieId, userId);
	}
	
	public List<Interest> getMovieInterest(int userId) {
		
		return movieDAO.selecetGetMovieInterest(userId);
	}
	
	public int addRecord(int userId, int movieId , String movieName) {
		
		int count = movieDAO.selectIsDuplicateRecord(userId, movieId);
		
		if(count > 0) {
			return 0;
		}
		return movieDAO.insertRecord(userId, movieId, movieName);
	}
	
	public List<Calendar> getRecordListByUserId(int userId) {
		
		List<Record> recordList = movieDAO.selectGetRecordListByUserId(userId);
		
		List<Calendar> calendarList = new ArrayList<>();
		for(Record recordd:recordList) {
			Calendar calendar = new Calendar();
			calendar.setTitle(recordd.getMovieName());
			calendar.setStart(recordd.getCreatedAt());
			
			calendarList.add(calendar);
		}
		
		return calendarList;
	}
	
	public List<Record> getRecordListByDate(int userId, String date) {
	
		String endDate = date + " 23:59:59";
		
		return movieDAO.selectGetRecorListByDate(userId, date, endDate);
	}
	
	
}
