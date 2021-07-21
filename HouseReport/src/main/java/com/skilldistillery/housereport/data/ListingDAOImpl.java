package com.skilldistillery.housereport.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Event;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class ListingDAOImpl implements ListingDAO {
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
	
	@Autowired
	AddressDAOImpl addressDao;
	
	@Autowired
	CommentDAOImpl commentDao;
	
	@Autowired
	EventDAOImpl eventDao;

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
	public Listing create(Listing listing, User user, Address address, PropertyType propertyType) {
		Address dbAddress = addDAO.create(address);
		User dbUser = em.find(User.class, user.getId());
		System.out.println(dbUser.getId() + "TEST FROM IMPL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		PropertyType dbPropertyType = propertyTypeDao.create(propertyType);
		listing.setUser(dbUser);
		listing.setAddress(dbAddress);
		listing.setPropertyType(dbPropertyType);
		listing.setCreatedOn(LocalDateTime.now());
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
		System.out.println("--------------------------break1---------------------------");
		Address address = addressDao.findById(dbListing.getAddress().getId());
		System.out.println("--------------------------break2---------------------------");
		PropertyType property = propertyTypeDao.findById(dbListing.getPropertyType().getId());
		System.out.println("--------------------------break3---------------------------");
		for (Event event : dbListing.getEvents()) {
//			eventDao.delete(event.getId());
			em.remove(event);
		}
		System.out.println("--------------------------break4---------------------------");
		for (ListingPhoto photo : dbListing.getListingPhotos()) {
//			listingPhotoDao.delete(photo);
			em.remove(photo);
		}
		System.out.println("--------------------------break5---------------------------");
		for (Comment comment : dbListing.getComments()) {
//			commentDao.deleteComment(comment.getId());
			em.remove(comment);
		}
		System.out.println("--------------------------break6---------------------------");
		for (User user : dbListing.getFavoriteUsers()) {
//			List<Listing> userFavoriteList = user.getFavorites();
//			for (Listing favListing : userFavoriteList) {
//				if (favListing.getId() == dbListing.getId());
//				em.remove(favListing);
			em.remove(user);
			}
			System.out.println("--------------------------break7---------------------------");
//		}
		System.out.println("--------------------------break8---------------------------");
//		for (Listing userListing : dbListing.getUser().getListings()) {
//			if(dbListing.getId() == userListing.getId()) {
//				em.remove(userListing);
//			}
			System.out.println("--------------------------break9---------------------------");
//		}
		System.out.println("--------------------------break10---------------------------");
		for (Rating rating : dbListing.getRatings()) {
			em.remove(rating);
		}
		System.out.println("--------------------------break11---------------------------");
		em.remove(dbListing);
//		em.remove(property);
		System.out.println("--------------------------break12---------------------------");
		em.remove(address);
		System.out.println("--------------------------break13---------------------------");
		System.out.println("--------------------------break14---------------------------");
		boolean successfulDelete = !em.contains(dbListing);
		System.out.println("--------------------------break15---------------------------");
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

	@Override
	public List<Listing> displayListings() {
		String jpql = "select l FROM Listing l";
		List<Listing> allListings = em.createQuery(jpql, Listing.class).getResultList();
		return allListings;
	}

}
