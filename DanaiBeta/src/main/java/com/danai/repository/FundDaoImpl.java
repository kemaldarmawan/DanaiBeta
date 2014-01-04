package com.danai.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Fund;

@Repository
public class FundDaoImpl implements FundDao {

	@Autowired
	private SessionFactory session;
	
	@Transactional
	public void add(Fund fund) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(fund);

	}

	@Transactional
	public void edit(Fund fund) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(fund);

	}

	@Transactional
	public void delete(int fundId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getFund(fundId));

	}

	@Transactional
	public Fund getFund(int fundId) {
		// TODO Auto-generated method stub
		return (Fund)session.getCurrentSession().get(Fund.class, fundId);
	}

	@Transactional
	public List getAllFund() {
		// TODO Auto-generated method stub	
		return session.getCurrentSession().createQuery("from Fund").list();
	}


}
