package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.User;

public interface ListingPhotoDAO {
	
	ListingPhoto findById(int id);
	ListingPhoto create(Listing listing, User user, Address address, PropertyType propertyType, ListingPhoto listingPhoto);
	boolean delete(ListingPhoto listingPhoto);
	ListingPhoto update(ListingPhoto listingPhoto, Listing listing);

}
