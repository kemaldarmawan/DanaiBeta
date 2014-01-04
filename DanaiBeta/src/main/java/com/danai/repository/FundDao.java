package com.danai.repository;

import java.util.List;

import com.danai.model.Fund;

public interface FundDao {

	public void add(Fund fund);
	public void edit(Fund fund);
	public void delete(int fundId);
	public Fund getFund(int fundId);
	public List getAllFund();

}
