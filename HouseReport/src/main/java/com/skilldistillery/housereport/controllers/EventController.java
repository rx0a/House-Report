package com.skilldistillery.housereport.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
					params="listId",
					method=RequestMethod.POST)
	public String createEvent(Model model, Event event, int listId) {
		System.out.println(event.getId() + "EVENT ID---------------------------");
		System.out.println("---------------------------TEST--------------------");
		System.out.println(listId + "-----------------------TEST----------------");
		Listing dbListing = listingDao.findById(listId);
		System.out.println(dbListing.getId());
		event.addListing(dbListing);
		Event dbEvent = eventDao.create(event);
		System.out.println(dbEvent.getId() + "AFTER EVENT ID--------------------------");
//		dbListing.addEvent(dbEvent);
		model.addAttribute("selectedListing", dbListing);
		return "listing";
	}
	
	@RequestMapping(path="deleteEvent.do",
					method=RequestMethod.POST)
	public String deleteEvent(RedirectAttributes redir, Event event, Listing listing) {
		Listing dbListing = listingDao.findById(listing.getId());
		dbListing.removeEvent(eventDao.findById(event.getId()));
		redir.addFlashAttribute("listing", dbListing);
		return "redirect:listing.do";
	}
	
	@RequestMapping(path="editEvent.do", 
					method=RequestMethod.POST)
	public String editEvent(Model model, Event event, Listing listing) {
		Event dbEvent = eventDao.findById(event.getId());
		Listing dbListing = listingDao.findById(listing.getId());
		model.addAttribute("event", dbEvent);
		model.addAttribute("listing", dbListing);
		return "editEvent";
	}
	
	@RequestMapping(path="pushEditedEvent.do",
					method=RequestMethod.POST)
	public String pushEditedEvent(Model model, Event event, Listing listing) {
		Event dbEvent = eventDao.findById(event.getId());
		dbEvent.setEventDate(event.getEventDate());
		dbEvent.setEventType(event.getEventType());
		eventDao.update(dbEvent.getId(), dbEvent);
		return "redirect:listing.do";
	}
	
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(true);
            webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
            webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
                    @Override
                    public void setAsText(String text) throws IllegalArgumentException {
                            setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    }
                    @Override
                    public String getAsText() throws IllegalArgumentException {
                            return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
                    }
            });
            webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
                    @Override
                    public void setAsText(String text) throws IllegalArgumentException {
                            setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
                    }
                    @Override
                    public String getAsText() throws IllegalArgumentException {
                            return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
                    }
            });
            // 2020-11-04T09:44
            webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
                    @Override
                    public void setAsText(String text) throws IllegalArgumentException {
                            setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
                    }
                    @Override
                    public String getAsText() throws IllegalArgumentException {
                            return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
                    }
            });
    }

}
