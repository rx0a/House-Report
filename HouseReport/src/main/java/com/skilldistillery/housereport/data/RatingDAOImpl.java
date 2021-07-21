package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.User;
@Service
@Transactional
public class RatingDAOImpl implements RatingDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Rating createRating(Rating rating) {
		em.persist(rating);
		em.flush();
		return rating;
	}

	@Override
	public Rating updateRating(Rating rating, User user, Listing listing) {
		Rating dbRating = em.find(Rating.class, rating.getId());
		dbRating.setListing(rating.getListing());
		dbRating.setUser(rating.getUser());
		dbRating.setRating(rating.isRating());
		em.flush();
		return dbRating;
	}
	
	
	@Override
	public boolean deleteRating(Rating rating) {
		Rating dbRating = em.find(Rating.class, rating.getId());
		em.remove(dbRating);
		boolean successfulDelete = !em.contains(dbRating);
		return successfulDelete;
	}

}
