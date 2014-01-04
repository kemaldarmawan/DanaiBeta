package com.danai.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	
	@Autowired
	private SessionFactory session;

	@Transactional
	public void add(Project project) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(project);

	}

	@Transactional
	public void edit(Project project) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(project);

	}

	@Transactional
	public void delete(int projectId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getProject(projectId));

	}

	@Transactional
	public Project getProject(int projectId) {
		// TODO Auto-generated method stub
		return (Project)session.getCurrentSession().get(Project.class, projectId);
	}

	@Transactional
	public List getAllProject() {
		// TODO Auto-generated method stub	
		return session.getCurrentSession().createQuery("from Project").list();
	}

}
