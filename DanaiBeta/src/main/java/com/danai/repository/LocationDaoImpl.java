package com.danai.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Location;

@Repository
public class LocationDaoImpl implements LocationDao {
	
	@Autowired
	private SessionFactory session;

	@Transactional
	public void add(Location location) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(location);

	}

	@Transactional
	public void edit(Location location) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(location);

	}

	@Transactional
	public void delete(int locationId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getLocation(locationId));

	}

	@Transactional
	public Location getLocation(int locationId) {
		// TODO Auto-generated method stub
		return (Location)session.getCurrentSession().get(Location.class, locationId);
	}

	@Transactional
	public List getAllLocation() {
		// TODO Auto-generated method stub
		return session.getCurrentSession().createQuery("from Location order by province asc, city asc").list();
	}

}
