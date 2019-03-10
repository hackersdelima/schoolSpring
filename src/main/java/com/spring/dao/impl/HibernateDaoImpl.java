package com.spring.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.service.spi.SessionFactoryServiceRegistryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.HibernateDao;
import com.spring.model.HibernateModel;

@Repository
@Transactional
public class HibernateDaoImpl implements HibernateDao {
	
	 private SessionFactory sessionFactory;
	 
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
	        
	    }
	 
	
	@Override
	public boolean insert(HibernateModel hm) {
		Session session =this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(hm);
		return true;
	}

}
