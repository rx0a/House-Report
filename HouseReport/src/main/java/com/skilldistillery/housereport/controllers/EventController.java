package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.housereport.data.EventDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.entities.Event;
import com.skilldistillery.housereport.entities.Listing;

@Controller
public class EventController {
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private ListingDAO listingDao;
	
	@RequestMapping(path="event.do")
	public String event() {
		return "addEvent";
	}
	
	@RequestMapping(path="addEvent.do",
					method=RequestMethod.POST)
	public String addEvent(Model model, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("listing", dbListing);
		return "addEvent";
	}
	
	@RequestMapping(path="createEvent.do",
					method=RequestMethod.POST)
	public String createEvent(RedirectAttributes redir, Event event, Listing listing) {
		Event dbEvent = eventDao.create(event);
		Listing dbListing = listingDao.findById(listing.getId());
		Event persistEvent = eventDao.findById(dbEvent.getId());
		persistEvent.addListing(dbListing);
		dbListing.addEvent(persistEvent);
		redir.addFlashAttribute("listing", dbListing);
		
		return "redirect:listing.do";
	}
	
	@RequestMapping(path="deleteEvent.do",
					method=RequestMethod.POST)
	public String deleteEvent(RedirectAttributes redir, Event event, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		dbListing.removeEvent(eventDao.findById(event.getId()));
		redir.addFlashAttribute("listing", dbListing);
		return "redirect:listing.do";
	}

}
