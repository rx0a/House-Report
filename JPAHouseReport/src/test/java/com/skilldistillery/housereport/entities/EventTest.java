package com.skilldistillery.housereport.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class EventTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}

	@Test
	@DisplayName("testing event date")
	void test() {
		assertNotNull(event);
		assertEquals("Hail Storm", event.getEventType());
		assertEquals(2012, event.getEventDate().getYear());
		assertEquals(05, event.getEventDate().getMonthValue());
		assertEquals(21, event.getEventDate().getDayOfMonth());	
	}
	
	@Test
	@DisplayName("Testing event listing mapping")
	void test2() {
		assertNotNull(event.getListings());
		assertEquals(1, event.getListings().size());
	}
}
