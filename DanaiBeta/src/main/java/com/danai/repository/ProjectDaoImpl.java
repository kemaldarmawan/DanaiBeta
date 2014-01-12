package com.danai.repository;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	
	@Autowired
	private SessionFactory session;
	
	ArrayList<Order> orderList = new ArrayList<Order>();
	
	@Override
	public void clearOrder() {
		// TODO Auto-generated method stub
		orderList.clear();
		
	}
	
	@Override
	public void addOrder(String attribute, boolean asc) {
		// TODO Auto-generated method stub
		if (asc)
			orderList.add(Order.asc(attribute));
		else
			orderList.add(Order.desc(attribute));	
	}
	
	public void iterateOrder(Criteria c)
	{
		for (int i=0;i<orderList.size();i++)
			c.addOrder(orderList.get(i));
	}

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
		Criteria c = session.getCurrentSession().createCriteria(Project.class);
		iterateOrder(c);
		return c.list();
		
	}

	@Transactional
	public List getProjectByLocation(int locationId) {
		// TODO Auto-generated method stub
		Criteria c = session.getCurrentSession().createCriteria(Project.class);
		iterateOrder(c);
		return c.createCriteria("location").add(Restrictions.eq("locationId", locationId)).list();
	}

	@Transactional
	public List getProjectSearchByTitle(String search) {
		// TODO Auto-generated method stub
		Criteria criteria = session.getCurrentSession().createCriteria(Project.class);
		criteria.add(Restrictions.like("title", '%'+search+'%') );
		iterateOrder(criteria);
		return criteria.list();
	}


	@Transactional
	public List getProjectByCategory(int categoryId) {
		// TODO Auto-generated method stub
		Criteria c =session.getCurrentSession().createCriteria(Project.class);
		iterateOrder(c);
		return c.createCriteria("category").add(Restrictions.eq("categoryId", categoryId)).list();
	}

	@Transactional
	public List getProjectSearchByUsername(String username) {
		// TODO Auto-generated method stub
		Criteria c =session.getCurrentSession().createCriteria(Project.class);
		iterateOrder(c);
		return c.createCriteria("user").add(Restrictions.like("username", '%'+username+'%' ) ).list();
	}
	
	@Transactional
	public List getProjectSearchByCategory(String categoryName) {
		// TODO Auto-generated method stub
		Criteria c =session.getCurrentSession().createCriteria(Project.class);
		iterateOrder(c);
		return c.createCriteria("category").add(Restrictions.like("name", '%'+categoryName+'%' ) ).list();
	}

	

}
