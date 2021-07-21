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
		em.persist(event);
		em.flush();
		return event;
	}

	@Override
	public Event update(int id, Event event) {
		Event dbEvent = em.find(Event.class, id);
		System.out.println("before change: " + dbEvent);
		dbEvent.setEventType(event.getEventType());
		dbEvent.setEventDate(event.getEventDate());
		em.flush();
		System.out.println("after change: " + dbEvent);
		return dbEvent;
	}

	@Override
	public boolean delete(int id) {
		Event event = em.find(Event.class, id);
		em.remove(event);
		boolean deleted = !em.contains(event);
		return deleted;
	}
}