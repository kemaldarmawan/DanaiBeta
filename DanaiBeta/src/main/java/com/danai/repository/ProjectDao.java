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
	public List getProjectSearchByTitle(String search);
	public void setOrder(String attribute, int asc);

}
