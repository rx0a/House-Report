package com.skilldistillery.housereport.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ListingPhotoTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ListingPhoto photo;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAHouseReport");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		photo = em.find(ListingPhoto.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		photo = null;
	}

	@Test
	void test_photo_mapped_toDB() {

		assertNotNull(photo);
		assertEquals("https://www.zillow.com/homedetails/595-N-Gilpin-St-Denver-CO-80218/13345693_zpid/?mmlb=g,0", photo.getImgUrl());
	}
	
	@Test
	void test_photo_mapped_to_listing() {

		assertNotNull(photo);
		assertEquals(3438, photo.getListing().getSquareFeet());
	}


}
