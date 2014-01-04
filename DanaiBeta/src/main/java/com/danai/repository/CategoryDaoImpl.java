package com.danai.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory session;
	
	@Transactional
	public void add(Category category) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(category);

	}

	@Transactional
	public void edit(Category category) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(category);

	}

	@Transactional
	public void delete(int categoryId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getCategory(categoryId));

	}

	@Transactional
	public Category getCategory(int categoryId) {
		// TODO Auto-generated method stub
		return (Category)session.getCurrentSession().get(Category.class, categoryId);
	}

	@Transactional
	public List getAllCategory() {
		// TODO Auto-generated method stub
		return session.getCurrentSession().createQuery("from Category").list();
	}

}
