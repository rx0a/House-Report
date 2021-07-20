package com.skilldistillery.housereport.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Listing;
@Controller
public class ResultsController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ListingDAO listingDao;

	@RequestMapping(path = { "results.do" })
	public ModelAndView showResults(Model model) {
		ModelAndView mv = new ModelAndView();
		List<Listing> listings = listingDao.listings();
		for (Listing listing : listings) {
			listingDao.updateRating(listing.getId());
		}
		mv.addObject("listings", listingDao.listings());
		mv.setViewName("results");
		return mv;
	}
}
