package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.GeneraldetailsDao;
import com.spring.model.Generaldetails;
import com.spring.service.GeneraldetailsService;

@Service
public class GeneraldetailsServiceImpl implements GeneraldetailsService{
	@Autowired
	GeneraldetailsDao generaldetailsDao;
	
	@Override
	public void saveOrUpdate(Generaldetails generaldetails) {
		generaldetailsDao.saveOrUpdate(generaldetails);
	}

	@Override
	public Generaldetails getOne() {
		return generaldetailsDao.getOne();
	}
}
