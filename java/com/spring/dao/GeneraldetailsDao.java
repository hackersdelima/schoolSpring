package com.spring.dao;

import com.spring.model.Generaldetails;

public interface GeneraldetailsDao {
	public void saveOrUpdate(Generaldetails generaldetails);

	public Generaldetails getOne();

}
