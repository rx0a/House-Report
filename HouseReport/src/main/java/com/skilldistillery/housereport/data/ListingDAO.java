package com.skilldistillery.housereport.data;

import java.util.List;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.User;

public interface ListingDAO {
	
	Listing findById(int id);
	boolean delete(Listing listing);
	Listing update(Listing listing, Address address);
	List<Listing> listings();
	double updateRating(int id);
	Listing create(Listing listing, User user, Address address, PropertyType propertyType);

}
