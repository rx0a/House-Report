package com.skilldistillery.housereport.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Event;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}
	
	@Override
	public User findByUsername(String username) {
		String jpql = "SELECT u FROM User u WHERE u.username = :username";
		User user = em.createQuery(jpql, User.class).setParameter("username", username).getSingleResult();
		return user;
	}
	
	@Override
	public List<User> find(String keyword) {
		String jpql = "SELECT u FROM User u WHERE u.firstName LIKE :k OR u.username LIKE :k OR u.lastName LIKE :k OR u.email LIKE :k";
		keyword = "%" + keyword + "%";
		List<User> users = em.createQuery(jpql, User.class).setParameter("k", keyword).getResultList();
		return users;
	}
	
	@Override
	public boolean checkUsername(String username) {
		String jpql = "SELECT u.username FROM User u";
		List<String> usernames = em.createQuery(jpql, String.class).getResultList();
		for (String userName : usernames) {
			if(userName.equals(username)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean checkEmail(String email) {
		String jpql = "SELECT u.email FROM User u";
		List<String> emails = em.createQuery(jpql, String.class).getResultList();
		for (String userEmail : emails) {
			if(userEmail != null) {
				if(userEmail.equals(email)) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean deleteUser(User user) {
		User dbUser = em.find(User.class, user.getId());
		
		if(dbUser.getComments() != null) {
			for (Comment comment : dbUser.getComments()) {
				em.remove(comment);
			}}
		
		if(dbUser.getRatings() != null) {
		for (Rating rating : dbUser.getRatings()) {
			em.remove(rating);
		}}

		
		if(dbUser.getFavorites() != null) {
		for (Listing favorite : dbUser.getFavorites()) {
			em.remove(favorite);
		}}
//		List<Listing> deletedUserListings = dbUser.getListings();
//		if(deletedUserListings != null) {
//		for (Listing listing : deletedUserListings) {
//			Address address =listing.getAddress();
//			for (Event event : listing.getEvents()) {
//				em.remove(event);
//				System.out.println("TEST 8=---------------------------------------------");
//			}
//			for (ListingPhoto photo : listing.getListingPhotos()) {
//				em.remove(photo);
//				System.out.println("TEST 9=---------------------------------------------");
//			}
//			for (Comment comment : listing.getComments()) {
//				em.remove(comment);
//				System.out.println("TEST 10=---------------------------------------------");
//			}
//			em.remove(listing);
//			System.out.println("TEST 11=---------------------------------------------");
//			em.remove(address);
//			System.out.println("TEST 12=---------------------------------------------");
//		}}
		em.remove(dbUser);
		System.out.println("TEST 12=---------------------------------------------");
		boolean successfulDelete = !em.contains(dbUser);
		System.out.println(successfulDelete);
		return successfulDelete;
	}

	@Override
	public User updateUser(User user) {
		User dbUser = em.find(User.class, user.getId());
		dbUser.setUsername(user.getUsername());
		dbUser.setPassword(user.getPassword());
		dbUser.setLastName(user.getLastName());
		dbUser.setFirstName(user.getFirstName());
		dbUser.setEmail(user.getEmail());
		dbUser.setEnabled(user.getEnabled());
		dbUser.setRole(user.getRole());
		em.flush();
		
		return dbUser;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}
	
	@Override
	public List<User> displayUsers(){
		String jpql = "select u FROM User u";
		List<User> allUsers = em.createQuery(jpql, User.class).getResultList();
		return allUsers;
	}
	
	@Override
	public User deactivateUser (User user) {
		User dbUser = em.find(User.class, user.getId());
		dbUser.setEnabled(0);
		em.flush();
		return dbUser;
	}
	
	@Override
	public User activateUser (User user) {
		User dbUser = em.find(User.class, user.getId());
		dbUser.setEnabled(1);
		em.flush();
		return dbUser;
	}






}
