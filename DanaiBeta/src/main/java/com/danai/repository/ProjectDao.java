package com.danai.repository;

import java.util.List;

import com.danai.model.Project;

public interface ProjectDao {
	
	public void add(Project project);
	public void edit(Project project);
	public void delete(int projectId);
	public Project getProject(int projectId);
	public List getAllProject();
	public List getProjectByLocation(int locationId);
	public List getProjectByCategory(int categoryId);
	public List getProjectSearchByTitle(String search);
	public List getProjectSearchByUsername(String username);
	public List getProjectSearchByCategory(String categoryName);
	public void addOrder(String attribute, boolean asc);
	public void clearOrder();

}
