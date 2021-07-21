package com.skilldistillery.housereport.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.housereport.data.CommentDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Address;
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
	
	@RequestMapping(path="editComment.do", method=RequestMethod.POST)
	public String accountEditComment(Model model, int id) {
		model.addAttribute("editComment", id);
		return "userProfile";
	}
	
	@RequestMapping(path="accountEditedComment.do", params = {"id", "commentText"}, method=RequestMethod.POST)
	public String accountEditedComment(int id, String commentText) {
		Comment dbComment = commentDao.findById(id);
		dbComment.setComment(commentText);
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
	public String postComment(Model model, HttpSession session, String comment, int listingID, int userID) {
		Listing dbListing = listingDao.findById(listingID);
		User dbUser = userDao.findById(userID);
		Comment commentObj = new Comment(comment, LocalDateTime.now(), dbUser, dbListing);
		Comment dbComment = commentDao.createComment(commentObj, listingID, userID);
		dbUser = userDao.findByUsername(dbUser.getUsername());
//		dbUser.getComments().add(dbComment);
		dbListing = listingDao.findById(listingID);
		session.setAttribute("user", dbUser);
		model.addAttribute("selectedListing", dbListing);
		return "listing";
	}

	@RequestMapping(path="deleteComment.do", params = {"id"}, method=RequestMethod.POST)
	public String deleteComment(HttpSession session, int id) {
		Comment dbComment = commentDao.findById(id);
		User dbUser = dbComment.getUser();
//		User dbUser2 = userDao.findByUsername(dbUser.getUsername());
		dbUser.removeComment(dbComment);
//		Listing dbListing = dbComment.getListing();
//		dbListing.removeComment(dbComment);
//		Address address = dbListing.getAddress();
//		listingDao.update(dbListing, address);
//		userDao.updateUser(dbUser);
		commentDao.deleteComment(id);
//		userDao.updateUser(dbUser);
		session.setAttribute("user", dbUser);
		return "userProfile";
	}
}
