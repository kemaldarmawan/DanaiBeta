package com.danai.repository;

import java.util.List;

import com.danai.model.User;

public interface UserDao {
	public void add(User user);
	public void edit(User user);
	public void delete(int userId);
	public User getUser(int userId);
	public User getUser(String username);
	public List getAllUser();

}
