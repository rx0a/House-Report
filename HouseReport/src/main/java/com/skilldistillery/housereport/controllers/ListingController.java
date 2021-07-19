package com.skilldistillery.housereport.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;
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
	
	@RequestMapping(path="editListing.do",
					method=RequestMethod.POST)
	public String editListing(Model model, Listing listing, User user) {
		Listing dbListing = listingDao.findById(listing.getId());
		User dbUser = userDao.findById(user.getId());
		model.addAttribute("user", dbUser);
		model.addAttribute("listing", dbListing);
		return "editListing";
	}
	
	@RequestMapping(path="updateListing.do",
					method=RequestMethod.POST)
	public String updateListing(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		System.out.println("-------------------------------test-----------------------------");
		dbListing.setPrice(listing.getPrice());
		dbListing.setSquareFeet(listing.getSquareFeet());
		dbListing.setBathNumber(listing.getBathNumber());
		dbListing.setBedNumber(listing.getBedNumber());
		dbListing.setPropertyCrimeRate(listing.getPropertyCrimeRate());
		dbListing.setViolentCrimeRate(listing.getViolentCrimeRate());
		dbListing.setHoaMonthlyRate(listing.getHoaMonthlyRate());
		dbListing.setYearBuilt(listing.getYearBuilt());
		dbListing.setLotSizeSqft(listing.getLotSizeSqft());
		dbListing.setPropertyTax(listing.getPropertyTax());
		dbListing.setParkingType(listing.getParkingType());
		listingDao.update(dbListing, dbListing.getAddress());
		return "userProfile";
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