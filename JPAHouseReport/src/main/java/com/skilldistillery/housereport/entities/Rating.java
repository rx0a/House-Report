package com.skilldistillery.housereport.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="rating")
public class Rating {
	@EmbeddedId
	private RatingId id;
	@Column(name="rating")
	private boolean rating;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@OneToOne
	@JoinColumn(name="listing_id")
	private Listing listing;
	
	public Rating() {}
	
	public RatingId getId() {
		return id;
	}
	public void setId(RatingId id) {
		this.id = id;
	}
	public boolean isRating() {
		return rating;
	}
	public void setRating(boolean rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "Rating [id=" + id + ", rating=" + rating + "]";
	}

	
	

}
