package com.skilldistillery.housereport.data;

import java.util.List;

import com.skilldistillery.housereport.entities.User;

public interface UserDAO {

	User findById(int id);
	boolean deleteUser(User user);
	User updateUser(User user);
	User createUser(User user);
	User findByUsername(String username);
	boolean checkUsername(String username);
	boolean checkEmail(String email);
	List<User> displayUsers();
}
