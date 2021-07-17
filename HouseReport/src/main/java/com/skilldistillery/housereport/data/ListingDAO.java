package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

public interface ListingDAO {
	
	Listing findById(int id);
	Listing create(Listing listing);
	boolean delete(Listing listing);
	Listing update(Listing listing, User user, Address address);

}
