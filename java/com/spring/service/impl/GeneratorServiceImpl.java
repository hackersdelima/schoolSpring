package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.GeneratorDao;
import com.spring.service.GeneratorService;

@Service
public class GeneratorServiceImpl implements GeneratorService {
	@Autowired
	GeneratorDao generatorDao;

	@Override
	public int getmaxid(String tablename) {
		return generatorDao.getmaxid(tablename);
	}

}
