package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.RatingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;

import com.skilldistillery.housereport.entities.ListingPhoto;
import com.skilldistillery.housereport.entities.PropertyType;

import com.skilldistillery.housereport.entities.Rating;
import com.skilldistillery.housereport.entities.RatingId;

import com.skilldistillery.housereport.entities.User;

@Controller
public class ListingController {
	@Autowired
	private UserDAO userDao;

	@Autowired
	private ListingDAO listingDao;
	
	@Autowired
	private AddressDAO addressDao;

	@Autowired
	private RatingDAO ratingDao;

	@RequestMapping(path = { "showListings.do" })
	public String showListings(Model model) {
		return "listing";
	}

	@RequestMapping(path = "editListing.do", method = RequestMethod.POST)
	public String editListing(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("listing", dbListing);
		return "editListing";
	}

	@RequestMapping(path = "updateListing.do", method = RequestMethod.POST)
	public String updateListing(Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
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
		return "redirect:profile.do";
	}

	@RequestMapping(path = { "showRating.do" })
	public ModelAndView showRating(Listing listing) {
		ModelAndView mv = new ModelAndView();
		int listingID = listing.getId();
		listingDao.updateRating(listingID);
		mv.addObject("listing", listing);
		mv.setViewName("listing");
		return mv;
	}

	@RequestMapping(path = "listingUpdateListing.do", method = RequestMethod.POST)
	public String listingUpdateListing(Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
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
		return "redirect:listing.do";
	}
	
	@RequestMapping(path = "listingEditListing.do", method = RequestMethod.POST)
	public String listingEditListing(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("listing", dbListing);
		return "listingEditListing";
	}
	
	@RequestMapping(path = "expandListing.do", method = RequestMethod.POST)
	public ModelAndView expandListing(int id) {
		ModelAndView mv = new ModelAndView();
//		listingDao.updateRating(id);
		Listing listing = listingDao.findById(id);
		mv.addObject("selectedListing", listing);
		mv.setViewName("listing");
		return mv;
	}
	

	@RequestMapping(path="createListing.do", method=RequestMethod.POST)
	public String createListing(Model model, User user) {
		User dbUser = userDao.findById(user.getId());
		model.addAttribute("user", dbUser);
		return "createListing";
	}
	
	@RequestMapping(path="createdListing.do", method=RequestMethod.POST)
	public String createdListing(Model model, User user, Address address, Listing listing, PropertyType propertyType, ListingPhoto photo) {
		listingDao.create(listing, user, address, propertyType, photo);
		return "userProfile";
	}

	@RequestMapping(path = "addRating.do", params= {"listingID", "userID", "vote"}, method= RequestMethod.POST)
	public String addRating(Model model, int listingID, int userID, String vote) {
		User dbUser = userDao.findById(userID);
		Listing dbListing = listingDao.findById(listingID);
		int ratingNum = Integer.parseInt(vote);
		boolean rating = false;
		if (ratingNum == 1) rating = true;
		RatingId ratingID = new RatingId(listingID, userID);
		Rating ratingObj = new Rating(ratingID, rating, dbUser, dbListing);
		Rating persistedRating = ratingDao.createRating(ratingObj);
		model.addAttribute("selectedListing", dbListing);
		model.addAttribute("rating", persistedRating);
		return "listing";
		
	}

	

}