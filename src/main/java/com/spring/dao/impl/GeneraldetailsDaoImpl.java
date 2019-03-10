package com.spring.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.GeneraldetailsDao;
import com.spring.model.Generaldetails;

@Repository
@Transactional
public class GeneraldetailsDaoImpl implements GeneraldetailsDao{

 private SessionFactory sessionFactory;
	 
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
	    }
	 

	@Override
	public void saveOrUpdate(Generaldetails generaldetails) {
		Session session =sessionFactory.getCurrentSession();
		 session.saveOrUpdate(generaldetails);
	}
	@Override
	public Generaldetails getOne() {
		Session session =sessionFactory.getCurrentSession();
		Generaldetails g = (Generaldetails)session.get(Generaldetails.class, 1);
		return g;
	}

}
