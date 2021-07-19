package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

@Controller
public class FavoriteController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="addToFavorites.do", method=RequestMethod.POST)
	public String addToFavorites(User user, Listing listing) {
		User dbUser = userDao.findById(user.getId());
		dbUser.addFavorite(listing);
		userDao.updateUser(dbUser);
		return "redirect:listing.do";
	}
	
	@RequestMapping(path="deleteFromFavorites.do", method=RequestMethod.POST)
	public String deleteFromFavorites(User user, Listing listing) {
		User dbUser = userDao.findById(user.getId());
		dbUser.removeFavorite(listing);
		userDao.updateUser(dbUser);
		return "redirect:profile.do";
	}
}
