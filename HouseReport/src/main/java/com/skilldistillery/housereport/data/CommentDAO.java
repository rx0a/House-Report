package com.skilldistillery.housereport.data;

import java.time.LocalDateTime;

import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

public interface CommentDAO {

	Comment findById(int id);
	Comment createComment(Comment comment);
	Comment updateComment(int id, Comment comment);
	boolean deleteComment(int id);
}
