package com.danai.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Location {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int locationId;
	@Column
	private String city;
	@Column
	private String province;
	
	@OneToMany(mappedBy="location", fetch=FetchType.LAZY)
	private Set<Project> projects;
	
	
	public Location() {}
	public Location(int locationId, String city, String province) {
		super();
		this.locationId = locationId;
		this.city = city;
		this.province = province;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Set<Project> getProjects() {
		return projects;
	}
	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}
	
	
	
	
	

}
