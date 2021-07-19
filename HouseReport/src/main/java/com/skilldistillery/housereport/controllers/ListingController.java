package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Listing;
@Controller
public class ListingController {
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ListingDAO listingDao;

	@RequestMapping(path = { "showListings.do" })
	public String showListings(Model model) {
		return "listing";
	}
	
	@RequestMapping(path = { "showRating.do"})
	public ModelAndView showRating (Listing listing) {
		ModelAndView mv = new ModelAndView();
		int listingID = listing.getId();
		int listingRating = listingDao.getListingRating(listingID);
		listing.setAccuracyRating(listingRating);
		mv.addObject("listing", listing);
		mv.setViewName("listing");
		return mv;
	}
}