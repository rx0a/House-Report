package com.skilldistillery.housereport.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

public class CommentDAOImpl implements CommentDAO {
EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAHouseReport");

@Override
	public Comment findById(int id) {
	Comment comment = new Comment();
	EntityManager em = emf.createEntityManager();	
		comment = em.find(Comment.class, id);	
	em.close();
		return comment;
	}

	@Override
	public Comment createComment(String comment, LocalDateTime commentDate, User user, Listing listing) {
		Comment commentObject = new Comment(comment, commentDate, user, listing);
		EntityManager em = emf.createEntityManager();	
		 em.getTransaction().begin();    
		em.persist(commentObject);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return commentObject;
	}

	@Override
	public Comment updateComment(int id, Comment comment) {
		EntityManager em = emf.createEntityManager();	
		 em.getTransaction().begin();    
		    Comment dbComment = em.find(Comment.class, id);
		    dbComment.setComment(comment.getComment());
		    dbComment.setCommentDate(comment.getCommentDate());
		    em.getTransaction().commit();
		em.close();
		return dbComment;
	}

	@Override
	public boolean deleteComment(int id) {
		EntityManager em = emf.createEntityManager();	
		em.getTransaction().begin();
		Comment deletedComment = em.find(Comment.class, id);
		em.remove(deletedComment);
		  boolean successfulRemove;			    
		    successfulRemove = !em.contains(deletedComment);
		    em.getTransaction().commit();
		em.close();
		return successfulRemove;
	}
	
	
	
	
	
	
}
