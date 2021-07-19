package com.skilldistillery.housereport.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		em.remove(dbUser);
		boolean successfulDelete = !em.contains(dbUser);
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






}
