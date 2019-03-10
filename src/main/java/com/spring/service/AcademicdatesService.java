package com.spring.service;

import java.util.List;

import com.spring.model.Academicdates;

public interface AcademicdatesService {
	public List<Academicdates> findAll();
	public void save(Academicdates academicdates);
	public Academicdates findOne(int id);
	public void update(Academicdates academicdates);
	
}
