package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Event;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Event findById(int id) {
		return em.find(Event.class, id);
	}

	@Override
	public Event create(Event event) {
		em.getTransaction().begin();
		em.persist(event);
		em.flush();
		em.getTransaction().commit();
		return event;
	}

	@Override
	public Event update(int id, Event event) {
		Event dbEvent = em.find(Event.class, id);
		System.out.println("before change: " + dbEvent);
		em.getTransaction().begin();
		dbEvent.setEventType(event.getEventType());
		dbEvent.setEventDate(event.getEventDate());
		em.flush();
		em.getTransaction().commit();
		System.out.println("after change: " + dbEvent);
		return dbEvent;
	}

	@Override
	public boolean delete(int id) {
		Event event = em.find(Event.class, id);
		em.getTransaction().begin();
		em.remove(event);
		boolean deleted = !em.contains(event);
		em.getTransaction().commit();
		return deleted;
	}
}