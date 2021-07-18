package com.skilldistillery.housereport.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.housereport.entities.Address;

@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Address findById(int id) {
		return em.find(Address.class, id);
	}

	@Override
	public Address find(String street, String street2, String city, String state, int postalCode) {
		String jpql = "SELECT a FROM address a WHERE a.street LIKE :street AND a.street2 LIKE :street2 AND a.city LIKE :city AND a.state LIKE :state AND a.postalCode LIKE :postalCode";
		Address address = em.createQuery(jpql, Address.class)
			.setParameter("street", street)
			.setParameter("street2", street2)
			.setParameter("city", city)
			.setParameter("state", state)
			.setParameter("postalCode", postalCode)
			.getSingleResult();
		return address;
	}
	
	@Override
	public List<Address> findByCity(String city) {
		String jpql = "SELECT a FROM address a WHERE a.city LIKE :city";
		List<Address> addresses = em.createQuery(jpql, Address.class)
			.setParameter("city", city)
			.getResultList();
		return addresses;
	}

	@Override
	public Address create(Address address) {
		em.getTransaction().begin();
		em.persist(address);
		em.flush();
		em.getTransaction().commit();
		return address;
	}

	@Override
	public Address update(Address address) {
		Address dbAddress = em.find(Address.class, address.getId());
		System.out.println("before change: " + dbAddress);
		em.getTransaction().begin();
		dbAddress.setStreet(address.getStreet());
		dbAddress.setStreet2(address.getStreet2());
		dbAddress.setCity(address.getCity());
		dbAddress.setState(address.getState());
		dbAddress.setPostalCode(address.getPostalCode());
		em.flush();
		em.getTransaction().commit();
		System.out.println("after change: " + dbAddress);
		return dbAddress;
	}

	@Override
	public boolean delete(int id) {
		Address address = em.find(Address.class, id);
		em.getTransaction().begin();
		em.remove(address);
		boolean deleted = !em.contains(address);
		em.getTransaction().commit();
		return deleted;
	}
}
