package com.bogus.bogusplus.movie.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusplus.movie.dao.MovieDAO;
import com.bogus.bogusplus.movie.model.Interest;

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
}
