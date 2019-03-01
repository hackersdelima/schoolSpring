package com.spring.dao;

import java.util.List;

import com.spring.model.Status;

public interface StatusDao {
	
	public List<Status> findAll();
	public void save(Status status);
	public Status findById(int id);
	public void update(Status status);
	public void saveOrUpdate(Status status);
	public void delete(Status status);

}
