package com.skilldistillery.housereport.data;

import java.util.List;

import com.skilldistillery.housereport.entities.Address;

public interface AddressDAO {

	Address findById(int id);

	Address create(Address address);

	Address update(Address address);

	boolean delete(int id);

	Address find(String street, String street2, String city, String state, int postalCode);

	List<Address> findByCity(String city);

}
