package com.skilldistillery.housereport.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Comment;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAHouseReport");
	@PersistenceContext
	private EntityManager em;

	@Override
	public Comment findById(int id) {
		Comment comment = new Comment();
		comment = em.find(Comment.class, id);
		return comment;
	}

	@Override
	public Comment createComment(Comment comment, int listingID, int userID) {
		System.out.println(comment.getComment());
		Listing listing = em.find(Listing.class, listingID);
		User user = em.find(User.class, userID);
		comment.setListing(listing);
		comment.setUser(user);
		em.persist(comment);
		em.flush();
		return comment;
	}

	@Override
	public Comment updateComment(Comment comment) {
		Comment dbComment = em.find(Comment.class, comment.getId());
		dbComment.setComment(comment.getComment());
		dbComment.setCommentDate(comment.getCommentDate());
		em.flush();
		return dbComment;
	}

	@Override
	public boolean deleteComment(int id) {
		Comment deletedComment = em.find(Comment.class, id);
		em.remove(deletedComment);
		boolean successfulRemove;
		successfulRemove = !em.contains(deletedComment);
		return successfulRemove;
	}

}
