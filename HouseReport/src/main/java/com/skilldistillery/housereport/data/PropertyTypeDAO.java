package com.skilldistillery.housereport.data;

import com.skilldistillery.housereport.entities.PropertyType;

public interface PropertyTypeDAO {

	PropertyType findById(int id);

	PropertyType create(PropertyType propertyType);

	boolean delete(PropertyType propertyType);

	PropertyType update(PropertyType propertyType);

}
