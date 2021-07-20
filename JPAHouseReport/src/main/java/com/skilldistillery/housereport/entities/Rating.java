package com.skilldistillery.housereport.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
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
	@MapsId(value="userId")
	private User user;
	@ManyToOne
	@JoinColumn(name="listing_id")
	@MapsId(value="listingId")
	private Listing listing;
	
	
	public Rating() {}
	
	
	
	public Rating(RatingId id, boolean rating, User user, Listing listing) {
		super();
		this.id = id;
		this.rating = rating;
		this.user = user;
		this.listing = listing;
	}



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
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Listing getListing() {
		return listing;
	}

	public void setListing(Listing listing) {
		this.listing = listing;
	}

	@Override
	public String toString() {
		return "Rating [id=" + id + ", rating=" + rating + "]";
	}

	
	

}
