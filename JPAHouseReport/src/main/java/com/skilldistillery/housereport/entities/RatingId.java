package com.skilldistillery.housereport.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RatingId implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="listing_id")
	private int listingId;
	@Column(name="user_id")
	private int userId;
	
	public RatingId() {}

	
	
	public RatingId(int listingId, int userId) {
		super();
		this.listingId = listingId;
		this.userId = userId;
	}



	public int getListingId() {
		return listingId;
	}

	public void setListingId(int listingId) {
		this.listingId = listingId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + listingId;
		result = prime * result + userId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RatingId other = (RatingId) obj;
		if (listingId != other.listingId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RatingId [listingId=" + listingId + ", userId=" + userId + "]";
	}

	

}
