package com.skilldistillery.housereport.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.housereport.data.CommentDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

@Controller
public class CommentController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ListingDAO listingDao;
	@Autowired
	private CommentDAO commentDao;
	
	@RequestMapping(path="accountEditComment.do", method=RequestMethod.POST)
	public String accountEditComment(Model model, Comment comment) {
		Comment dbComment = commentDao.findById(comment.getId());
		model.addAttribute("comment", dbComment);
		boolean accountEditComment = true;
		model.addAttribute("accountEditCommentBool", accountEditComment);
		return "editComment";
	}
	
	@RequestMapping(path="accountEditedComment.do", method=RequestMethod.POST)
	public String accountEditedComment(Comment comment) {
		Comment dbComment = commentDao.findById(comment.getId());
		dbComment.setComment(comment.getComment());
		commentDao.updateComment(dbComment);
		return "redirect:profile.do";
	}
	
	@RequestMapping(path="listingEditComment.do", method=RequestMethod.POST)
	public String listingEditComment(Model model, Comment comment) {
		Comment dbComment = commentDao.findById(comment.getId());
		model.addAttribute("comment", dbComment);
		boolean listingEditComment = true;
		model.addAttribute("listingEditCommentBool", listingEditComment);
		return "editComment";
	}
	
	@RequestMapping(path="listingEditedComment.do", method=RequestMethod.POST)
	public String listingEditComment(Comment comment) {
		Comment dbComment = commentDao.findById(comment.getId());
		dbComment.setComment(comment.getComment());
		commentDao.updateComment(dbComment);
		return "redirect:listing.do";
	}
	
	@RequestMapping(path="postComment.do", method=RequestMethod.POST)
	public String postComment(Comment comment, Listing listing, User user) {
		comment.setListing(listing);
		comment.setUser(user);
		comment.setCommentDate(LocalDateTime.now());
		Listing dbListing = listingDao.findById(listing.getId());
		Comment dbComment = commentDao.createComment(comment);
		dbListing.addComment(dbComment);
		listingDao.update(dbListing, dbListing.getAddress());
		return "redirect:listing.do";
	}

}
