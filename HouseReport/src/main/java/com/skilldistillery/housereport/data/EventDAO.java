package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.Event;

public interface EventDAO {

	Event findById(int id);

	Event create(Event event);

	Event update(int id, Event event);

	boolean delete(int id);

}
