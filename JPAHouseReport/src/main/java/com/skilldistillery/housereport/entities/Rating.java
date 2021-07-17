package com.skilldistillery.housereport.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="rating")
public class Rating {
	@EmbeddedId
	private RatingId id;
	@Column(name="rating")
	private boolean rating;
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
