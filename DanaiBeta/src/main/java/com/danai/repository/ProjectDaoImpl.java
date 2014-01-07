package com.danai.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
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

	@Transactional
	public List getProjectByLocation(int locationId) {
		// TODO Auto-generated method stub
		return session.getCurrentSession().createCriteria(Project.class).createCriteria("location").add(Restrictions.eq("locationId", locationId)).list();
	}

	@Transactional
	public List getProjectSearchByTitle(String search) {
		// TODO Auto-generated method stub
		Criteria criteria = session.getCurrentSession().createCriteria(Project.class);
		criteria.add(Restrictions.like("title", '%'+search+'%') );
		return criteria.list();
	}

	@Transactional
	public void setOrder(String attribute, int asc) {
		// TODO Auto-generated method stub
		
	}

}
