package com.skilldistillery.housereport.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="event_type")
	private String eventType;
	@Column(name="event_date")
	private LocalDate eventDate;
	
	@ManyToMany
	@JoinTable(name="listing_event", joinColumns=@JoinColumn(name="event_id"), inverseJoinColumns=@JoinColumn(name="listing_id"))
	private List<Listing> listings;
	
	public Event() {}
	
	public void addListing(Listing listing) {
        if(listings == null) listings = new ArrayList<>();

        if (!listings.contains(listing)) {
            listings.add(listing);
            listing.addEvent(this);
        }
    }

    public void removeListing(Listing listing) {
        if(listings != null && listings.contains(listing)) {
            listings.remove(listing);
            listing.removeEvent(this);
        }
    }
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	
	public LocalDate getEventDate() {
		return eventDate;
	}
	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}
	
	
	public List<Listing> getListings() {
		return listings;
	}


	public void setListings(List<Listing> listings) {
		this.listings = listings;
	}


	@Override
	public String toString() {
		return "Event [id=" + id + ", eventType=" + eventType + ", eventDate=" + eventDate + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Event other = (Event) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	

}
