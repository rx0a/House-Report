package com.skilldistillery.housereport.data;

import java.time.LocalDateTime;

import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

public interface CommentDAO {

	Comment findById(int id);
	Comment createComment(String comment, LocalDateTime commentDate, User user, Listing listing);
	Comment updateComment(int id, Comment comment);
	boolean deleteComment(int id);
}
