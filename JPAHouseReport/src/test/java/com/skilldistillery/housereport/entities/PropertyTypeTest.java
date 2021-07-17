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

class PropertyTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PropertyType propertyType;

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
		propertyType = em.find(PropertyType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		propertyType = null;
	}

	@Test
	void test_propertyType_mapped_toDB() {

		assertNotNull(propertyType);
		assertEquals(1, propertyType.getId());
	}
	
	@Test
	void test_propertyType_mapped_to_listing() {

		assertNotNull(propertyType);
		assertEquals(3438, propertyType.getListings().get(0).getSquareFeet());
	}

}
