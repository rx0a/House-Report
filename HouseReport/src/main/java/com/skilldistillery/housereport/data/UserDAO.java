package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.User;

public interface UserDAO {

	User findById(int id);
	
}
