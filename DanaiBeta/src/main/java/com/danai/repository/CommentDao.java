package com.danai.repository;

import java.util.List;

import com.danai.model.Comment;
import com.danai.model.Fund;

public interface CommentDao {
	public void add(Comment comment);
	public void edit(Comment comment);
	public void delete(int commentId);
	public Comment getComment(int commentId);
	public List getAllComment();

}
