package com.skilldistillery.housereport.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.ListingPhotoDAO;
import com.skilldistillery.housereport.data.PropertyTypeDAO;
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
	
	@Autowired
	private ListingPhotoDAO photoDao;
	
	@Autowired
	private PropertyTypeDAO propertyDao;

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
	public String updateListing(Address address, Listing listing, PropertyType propertyType, ListingPhoto photo) {
		Address dbAddress = addressDao.findById(address.getId());
		System.out.println(propertyType.getType() + "----------------------------------------test prop type");
		dbAddress.setStreet(address.getStreet());
		dbAddress.setStreet2(address.getStreet2());
		dbAddress.setCity(address.getCity());
		dbAddress.setState(address.getState());
		dbAddress.setPostalCode(address.getPostalCode());
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
		dbListing.getPropertyType().setType(propertyType.getType());
		listingDao.update(dbListing, dbAddress);
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
		listingDao.updateRating(id);
		Listing listing = listingDao.findById(id);
		mv.addObject("selectedListing", listing);
		mv.setViewName("listing");
		return mv;
	}
	

	@RequestMapping(path="createListing.do", method=RequestMethod.GET)
	public String createListing(Model model) {
		return "createListing";
	}
	
	@RequestMapping(path="createdListing.do", method=RequestMethod.POST)
	public String createdListing(Model model, HttpSession session, Address address, Listing listing, PropertyType propertyType, ListingPhoto photo) {
		User dbUser = (User)session.getAttribute("user");
		System.out.println(dbUser);
		listing.setUser(dbUser);
		ListingPhoto lp = photoDao.create(listing, dbUser, address, propertyType, photo);
		dbUser = userDao.findById(dbUser.getId());
		dbUser.getListings().size();
		session.setAttribute("user", dbUser);
		
		return addRating(model, lp.getListing().getId(), dbUser.getId(), "1");
		
//		dbUser.getListings().get(listing.getId()).getListingPhotos().add(photo);
//		session.setAttribute("user", dbUser);
//		photo.setListing(listing);
//		Listing dbListing = listingDao.create(listing, dbUser, address, propertyType, photo);
//		System.out.println(dbUser.getId() + "TEST FROM CREATED LISTING!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		photo.setListing(dbListing);
//		dbListing.getListingPhotos().add(photo);
//		ListingPhoto dbPhoto = photoDao.create(photo);
//		return "listing";
	}

	@RequestMapping(path = "addRating.do", params= {"listingID", "userID", "vote"}, method= RequestMethod.POST)
	public String addRating(Model model, int listingID, int userID, String vote) {
		User dbUser = userDao.findById(userID);
		Listing dbListing = listingDao.findById(listingID);
		int ratingNum = Integer.parseInt(vote);
		boolean rating = false;
		if (ratingNum == 1) rating = true;
		try {
			RatingId ratingID = new RatingId(listingID, userID);
			Rating ratingObj = new Rating(ratingID, rating, dbUser, dbListing);
			Rating persistedRating = ratingDao.createRating(ratingObj);
			dbListing.setAccuracyRating(listingDao.updateRating(listingID));
			Listing updatedRatingListing = listingDao.update(dbListing, dbListing.getAddress());
			model.addAttribute("selectedListing", updatedRatingListing);
			model.addAttribute("rating", persistedRating);
		} catch (Exception EntityExistsException) {
			model.addAttribute("selectedListing", dbListing);
			return "listing";
		}
		return "listing";
		
	}
	
	@RequestMapping(path="deleteListing.do", method=RequestMethod.POST)
	public String deleteListing(Listing listing) {
		System.out.println(listing.getId() + "-----------test-----------------------------listing---------");
		listingDao.delete(listing);
		return "redirect:profile.do";
	}
	
	@RequestMapping(path="modifyListing.do", params= {"action"}, method=RequestMethod.POST)
	public String modifyListing(Model model, RedirectAttributes redir, Listing listing, String action) {
		System.out.println(listing.getId() + "test from modifyListing---------------------------------------------");
		if(action.equals("Delete")) {
			redir.addFlashAttribute("listing", listing);
			return "deleteListing";
		} else if(action.equals("Edit")) {
			Listing dbListing = listingDao.findById(listing.getId());
			System.out.println(dbListing);
			model.addAttribute("listing", dbListing);
			return "editListing";
		} else {
			return "userProfile";
		}
	}

	

}