package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
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

	@Override
	public Listing findById(int id) {
		return em.find(Listing.class, id);
	}

	@Override
	public Listing create(Listing listing, User user, Address address) {
		Address dbAddress = addDAO.create(address);
		User dbUser = em.find(User.class, user.getId());
		listing.setUser(dbUser);
		listing.setAddress(dbAddress);
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

}
