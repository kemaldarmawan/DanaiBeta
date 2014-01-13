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
public class User {

	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userId;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String name;
	@Column
	private String bio;
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private Set<Project> createdProject;
	
	
	public User() {}
	public User(int id_user, String username, String password) {
		super();
		this.userId = id_user ;
		this.username = username;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}

	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int id_user) {
		this.userId = id_user;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public Set<Project> getCreatedProject() {
		return createdProject;
	}
	public void setCreatedProject(Set<Project> createdProject) {
		this.createdProject = createdProject;
	}
	
	

	
	
	

}
