package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.AcademicdatesDao;
import com.spring.model.Academicdates;
import com.spring.service.AcademicdatesService;

@Service
public class AcademicdatesServiceImpl implements AcademicdatesService{
	@Autowired
	AcademicdatesDao academicdatesDao;

	@Override
	public List<Academicdates> findAll() {
		return academicdatesDao.findAll();
	}

	@Override
	public void save(Academicdates academicdates) {
		academicdatesDao.save(academicdates);
		
	}

	@Override
	public Academicdates findOne(int id) {
		return academicdatesDao.findOne(id);
	}

	@Override
	public void update(Academicdates academicdates) {
		 academicdatesDao.update(academicdates);
	}
}
