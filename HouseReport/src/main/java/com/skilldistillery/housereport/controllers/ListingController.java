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
		int listingRating = listingDao.getListingRating(listingID);
		listing.setAccuracyRating(listingRating);
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
		Listing listing = listingDao.findById(id);
		mv.addObject("selectedListing", listing);
		mv.setViewName("listing");
		return mv;
	}
	
//	@RequestMapping(path = "addRating.do", params= {"listingID", "userID", "vote"}, method= RequestMethod.POST)
//	public String addRating(int listingID, int userID, String vote) {
//		int rating = Integer.parseInt(vote);
//		
//		
//	}
	

}