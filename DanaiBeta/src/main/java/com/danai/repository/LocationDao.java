package com.danai.repository;

import java.util.List;

import com.danai.model.Location;

public interface LocationDao {
	public void add(Location location);
	public void edit(Location location);
	public void delete(int locationId);
	public Location getLocation(int locationId);
	public List getAllLocation();
}