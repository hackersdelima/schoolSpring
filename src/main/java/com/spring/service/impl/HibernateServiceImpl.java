package com.spring.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.HibernateDao;
import com.spring.model.HibernateModel;
import com.spring.service.HibernateService;


@Service
public class HibernateServiceImpl implements HibernateService {

	@Autowired
	HibernateDao hibernateDao;
	
	@Override
	public boolean insert(HibernateModel hm) {
		return hibernateDao.insert(hm);
	}

}
