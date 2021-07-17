package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;

public interface ListingPhotoDAO {
	
	ListingPhoto findById(int id);
	ListingPhoto create(ListingPhoto listingPhoto);
	boolean delete(ListingPhoto listingPhoto);
	ListingPhoto update(ListingPhoto listingPhoto, Listing listing);

}
