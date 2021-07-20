package com.skilldistillery.housereport.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class ListingDAOImpl implements ListingDAO{
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	AddressDAOImpl addDAO;
	
	@Autowired
	UserDAOImpl userDAO;
	
	@Autowired
	PropertyTypeDAOImpl propertyTypeDao;
	
	@Autowired
	ListingPhotoDAOImpl listingPhotoDao;

	@Override
	public Listing findById(int id) {
		return em.find(Listing.class, id);
	}
	@Override
	public List<Listing> listings() {
		String jpql = "SELECT l FROM Listing l";
		List<Listing> listings = em.createQuery(jpql, Listing.class).getResultList();
		return listings;
	}

	@Override
	public Listing create(Listing listing, User user, Address address, PropertyType propertyType, ListingPhoto photo) {
		Address dbAddress = addDAO.create(address);
		User dbUser = em.find(User.class, user.getId());
		PropertyType dbPropertyType = propertyTypeDao.create(propertyType);
		ListingPhoto dbPhoto = listingPhotoDao.create(photo);
		listing.setUser(dbUser);
		listing.setAddress(dbAddress);
		listing.setPropertyType(dbPropertyType);
		listing.addPhoto(dbPhoto);
		em.persist(listing);
		em.flush();
		return listing;
	}

	@Override
	public Listing update(Listing listing, Address address) {
		Listing dbListing = em.find(Listing.class, listing.getId());
		dbListing.setPrice(listing.getPrice());
		dbListing.setSquareFeet(listing.getSquareFeet());
		dbListing.setBedNumber(listing.getBedNumber());
		dbListing.setBathNumber(listing.getBathNumber());
		dbListing.setPropertyCrimeRate(listing.getPropertyCrimeRate());
		dbListing.setViolentCrimeRate(listing.getViolentCrimeRate());
		dbListing.setHoaMonthlyRate(listing.getHoaMonthlyRate());
		dbListing.setYearBuilt(listing.getYearBuilt());
		dbListing.setLotSizeSqft(listing.getLotSizeSqft());
		dbListing.setPropertyTax(listing.getPropertyTax());
		dbListing.setParkingType(listing.getParkingType());
		
		Address dbAddress = addDAO.update(address);
		dbListing.setAddress(dbAddress);
		
		return dbListing;
	}

	@Override
	public boolean delete(Listing listing) {
		Listing dbListing = em.find(Listing.class, listing.getId());
		em.remove(dbListing);
		boolean successfulDelete = !em.contains(dbListing);
		return successfulDelete;
	}
	
	@Override
	public double updateRating(int id) {
		String jpql1 = "SELECT COUNT(r) from Rating r WHERE r.listing.id = :id";
		String jpql2 = "SELECT COUNT(r) FROM Rating r WHERE r.listing.id = :id AND r.rating = 1";
		long totalVotes = em.createQuery(jpql1, Long.class).setParameter("id", id).getSingleResult();
		System.out.println("----------TEST----------");
		System.out.println("Total Votes: " + totalVotes);
		long upVotes = em.createQuery(jpql2, Long.class).setParameter("id", id).getSingleResult();
		double yes = (double) upVotes;
		double total = (double) totalVotes;
		double accuracyRating = yes / total * 100;
		Listing listing = em.find(Listing.class, id);
		listing.setAccuracyRating(accuracyRating);
		em.flush();
		return accuracyRating;
	}
	

}
