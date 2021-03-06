package com.danai.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory session;
	
	@Override
	@Transactional
	public void add(User user) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(user);

	}

	@Override
	@Transactional
	public void edit(User user) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(user);

	}

	@Override
	@Transactional
	public void delete(int userId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getUser(userId));

	}

	@Override
	@Transactional
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return (User)session.getCurrentSession().get(User.class, userId);
	}
	
	@Transactional
	public User getUser(String username) {
		// TODO Auto-generated method stub
		Criteria criteria = session.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("username",username));
		if (criteria.list().size()>0)
			return (User) criteria.list().get(0);
		else return null;
	}

	@Override
	@Transactional
	public List getAllUser() {
		// TODO Auto-generated method stub	
		return session.getCurrentSession().createQuery("from User").list();
	}

}
