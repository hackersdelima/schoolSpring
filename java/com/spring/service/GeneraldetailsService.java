package com.spring.service;

import com.spring.model.Generaldetails;

public interface GeneraldetailsService {
	public void saveOrUpdate(Generaldetails generaldetails);

	public Generaldetails getOne();
}
