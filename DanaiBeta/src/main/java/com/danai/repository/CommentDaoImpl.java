package com.danai.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.danai.model.Comment;
import com.danai.model.Fund;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SessionFactory session;

	@Transactional
	public void add(Comment comment) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(comment);
	}

	@Transactional
	public void edit(Comment comment) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(comment);
	}

	@Transactional
	public void delete(int commentId) {
		// TODO Auto-generated method stub
		session.getCurrentSession().delete(getComment(commentId));
	}

	@Transactional
	public Comment getComment(int commentId) {
		// TODO Auto-generated method stub
		return (Comment)session.getCurrentSession().get(Comment.class, commentId) ;
	}

	@Override
	public List getAllComment() {
		// TODO Auto-generated method stub
		return session.getCurrentSession().createQuery("from Comment").list();
	}

}
