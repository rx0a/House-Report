package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.User;

public interface RatingDAO {

	boolean deleteRating(Rating rating);
	Rating createRating(Rating rating);
	Rating updateRating(Rating rating, User user, Listing listing);
	
}
