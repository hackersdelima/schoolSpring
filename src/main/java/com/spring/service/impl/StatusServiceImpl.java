package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.StatusDao;
import com.spring.model.Status;
import com.spring.service.StatusService;


@Service
public class StatusServiceImpl implements StatusService{
	@Autowired
	StatusDao statusDao;

	@Override
	public List<Status> findAll() {
		return statusDao.findAll();
	}

	@Override
	public void save(Status status) {
		statusDao.save(status);
	}

	@Override
	public Status findById(int id) {
		return statusDao.findById(id);
	}

	@Override
	public void update(Status status) {
statusDao.update(status);		
	}

	@Override
	public void saveOrUpdate(Status status) {
		statusDao.saveOrUpdate(status);
	}

	@Override
	public void delete(Status status) {
statusDao.delete(status);		
	}
	
	

}
