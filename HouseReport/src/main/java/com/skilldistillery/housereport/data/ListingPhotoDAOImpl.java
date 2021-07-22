package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.RatingId;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class ListingPhotoDAOImpl implements ListingPhotoDAO{	
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private ListingDAO listingDao;
	
	@Autowired
	private RatingDAO ratingDao;

	@Override
	public ListingPhoto findById(int id) {
		return em.find(ListingPhoto.class,id);
	}

	@Override
	public ListingPhoto create(Listing listing, User user, Address address, PropertyType propertyType, ListingPhoto listingPhoto) {
		listing.setAccuracyRating(100);
		Listing dbListing = listingDao.create(listing, user, address, propertyType);
		
		
		System.out.println(user.getId() + "USER ID TEST----------------------------------------");
//		RatingId id = new RatingId(dbListing.getId(), user.getId());
		System.out.println(1 + "---------------------------------------------------");
//		Rating rating = new Rating(id, true, user, dbListing);
		System.out.println(2 + "---------------------------------------------------");
//		Rating dbRating = ratingDao.createRating(rating);
		System.out.println(3 + "---------------------------------------------------");
//		dbListing.getRatings().add(rating);
		System.out.println(4 + "---------------------------------------------------");
		
//		Listing updatedListing = listingDao.update(dbListing, dbListing.getAddress());
		System.out.println(5 + "---------------------------------------------------");
		
		
		listingPhoto.setListing(dbListing);
//		listing.setListingPhotos(null);
//		listing.getListingPhotos().add(listingPhoto);
		em.persist(dbListing);
		em.persist(listingPhoto);
		em.flush();
		dbListing.addPhoto(listingPhoto);
		return dbListing.getListingPhotos().get(0);
	}

	@Override
	public ListingPhoto update(ListingPhoto listingPhoto, Listing listing) {
		ListingPhoto dbListingPhoto = em.find(ListingPhoto.class, listingPhoto.getId());
		dbListingPhoto.setImgUrl(listingPhoto.getImgUrl());
		dbListingPhoto.setListing(listingPhoto.getListing());
		return dbListingPhoto;
	}

	@Override
	public boolean delete(ListingPhoto listingPhoto) {
		ListingPhoto dbListingPhoto = em.find(ListingPhoto.class, listingPhoto.getId());
		em.remove(dbListingPhoto);
		boolean successfulDelete = !em.contains(dbListingPhoto);
		return successfulDelete;
	}

}