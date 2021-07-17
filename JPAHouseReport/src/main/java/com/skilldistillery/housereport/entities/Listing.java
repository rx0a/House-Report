package com.skilldistillery.housereport.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Listing {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Double price;
	@Column(name = "square_feet")
	private Integer SquareFeet;
	@Column(name = "bed_number")
	private Integer BedNumber;
	@Column(name = "bath_number")
	private Integer BathNumber;
	@Column(name = "property_crime_rate")
	private Double propertyCrimeRate;
	@Column(name = "violent_crime_rate")
	private Double violentCrimeRate;
	@Column(name = "hoa_monthly_rate")
	private Double hoaMonthlyRate;
	@Column(name = "created_on")
	private LocalDateTime createdOn;
	@Column(name = "year_built")
	private Integer yearBuilt;
	@Column(name = "lot_size_sqft")
	private Integer lotSizeSqft;
	@Column(name = "property_tax")
	private Double propertyTax;
	@Column(name = "parking_type")
	private String parkingType;

	@OneToMany(mappedBy="listing")
	private List<Comment> comments;

	@ManyToOne
	@JoinColumn(name = "property_id")
	private PropertyType propertyType;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany(mappedBy = "listings")
	private List<Event> events;
	@OneToOne(mappedBy = "listing")
	private Rating rating;
	
	@ManyToMany(mappedBy="favorites")
	private List<User> favoriteUsers;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "listing")
	private List<ListingPhoto> listingPhotos;

	public Listing() {
	}

	

	public List<Comment> getComments() {
		return comments;
	}



	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getSquareFeet() {
		return SquareFeet;
	}

	public void setSquareFeet(Integer squareFeet) {
		SquareFeet = squareFeet;
	}

	public Integer getBedNumber() {
		return BedNumber;
	}

	public void setBedNumber(Integer bedNumber) {
		BedNumber = bedNumber;
	}

	public Integer getBathNumber() {
		return BathNumber;
	}

	public void setBathNumber(Integer bathNumber) {
		BathNumber = bathNumber;
	}

	public Double getPropertyCrimeRate() {
		return propertyCrimeRate;
	}

	public void setPropertyCrimeRate(Double propertyCrimeRate) {
		this.propertyCrimeRate = propertyCrimeRate;
	}

	public Double getViolentCrimeRate() {
		return violentCrimeRate;
	}

	public void setViolentCrimeRate(Double violentCrimeRate) {
		this.violentCrimeRate = violentCrimeRate;
	}

	public Double getHoaMonthlyRate() {
		return hoaMonthlyRate;
	}

	public void setHoaMonthlyRate(Double hoaMonthlyRate) {
		this.hoaMonthlyRate = hoaMonthlyRate;
	}

	public LocalDateTime getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(LocalDateTime createdOn) {
		this.createdOn = createdOn;
	}

	public Integer getYearBuilt() {
		return yearBuilt;
	}

	public void setYearBuilt(Integer yearBuilt) {
		this.yearBuilt = yearBuilt;
	}

	public Integer getLotSizeSqft() {
		return lotSizeSqft;
	}

	public void setLotSizeSqft(Integer lotSizeSqft) {
		this.lotSizeSqft = lotSizeSqft;
	}

	public Double getPropertyTax() {
		return propertyTax;
	}

	public void setPropertyTax(Double propertyTax) {
		this.propertyTax = propertyTax;
	}

	public String getParkingType() {
		return parkingType;
	}

	public void setParkingType(String parkingType) {
		this.parkingType = parkingType;
	}

	public PropertyType getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(PropertyType propertyType) {
		this.propertyType = propertyType;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<ListingPhoto> getListingPhotos() {
		return listingPhotos;
	}

	public void setListingPhotos(List<ListingPhoto> listingPhotos) {
		this.listingPhotos = listingPhotos;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	


	public List<User> getFavoriteUsers() {
		return favoriteUsers;
	}

	public void setFavoriteUsers(List<User> favoriteUsers) {
		this.favoriteUsers = favoriteUsers;
	}
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Listing [id=" + id + ", price=" + price + ", SquareFeet=" + SquareFeet + ", BedNumber=" + BedNumber
				+ ", BathNumber=" + BathNumber + ", propertyCrimeRate=" + propertyCrimeRate + ", violentCrimeRate="
				+ violentCrimeRate + ", hoaMonthlyRate=" + hoaMonthlyRate + ", createdOn=" + createdOn + ", yearBuilt="
				+ yearBuilt + ", lotSizeSqft=" + lotSizeSqft + ", propertyTax=" + propertyTax + ", parkingType="
				+ parkingType + ", propertyType=" + propertyType + ", address=" + address + "]";
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
		Listing other = (Listing) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
