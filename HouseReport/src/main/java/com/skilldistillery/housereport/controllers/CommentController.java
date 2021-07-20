package com.skilldistillery.housereport.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(path="postComment.do", params = {"comment", "listingID", "userID"}, method=RequestMethod.POST)
	public String postComment(Model model, String comment, int listingID, int userID) {
		Listing dbListing = listingDao.findById(listingID);
		User dbUser = userDao.findById(userID);
		Comment commentObj = new Comment(comment, LocalDateTime.now(), dbUser, dbListing);
//		comment.setListing(listingDao.findById(listingID));
//		comment.setUser(userDao.findById(userID));
//		comment.setCommentDate(LocalDateTime.now());
//		comment.setComment(commentString);
		Comment dbComment = commentDao.createComment(commentObj, listingID, userID);
//		dbListing.addComment(dbComment);
//		dbUser.addComment(dbComment);
//		userDao.updateUser(dbUser);
//		listingDao.update(dbListing, dbListing.getAddress());
		model.addAttribute("selectedListing", dbListing);
		return "listing";
	}

}
