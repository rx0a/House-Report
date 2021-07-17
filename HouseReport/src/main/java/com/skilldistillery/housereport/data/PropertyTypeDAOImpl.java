package com.skilldistillery.housereport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.PropertyType;

@Service
@Transactional
public class PropertyTypeDAOImpl implements PropertyTypeDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public PropertyType findById(int id) {
		return em.find(PropertyType.class, id);
	}

	@Override
	public PropertyType create(PropertyType propertyType) {
		em.persist(propertyType);
		em.flush();
		return propertyType;
	}

	@Override
	public PropertyType update(PropertyType propertyType) {
		PropertyType dbPropertyType = em.find(PropertyType.class, propertyType.getId());
		dbPropertyType.setType(propertyType.getType());
		return dbPropertyType;
	}

	@Override
	public boolean delete(PropertyType propertyType) {
		PropertyType dbPropertyType = em.find(PropertyType.class, propertyType.getId());
		em.remove(dbPropertyType);
		boolean successfulDelete = !em.contains(dbPropertyType);
		return successfulDelete;
	}

}