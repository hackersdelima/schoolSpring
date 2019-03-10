package com.spring.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.AcademicdatesDao;
import com.spring.model.Academicdates;
import com.spring.model.Status;

@Repository
@Transactional
public class AcademicdatesDaoImpl implements AcademicdatesDao {
	private SessionFactory sessionFactory;
	 
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
	    }
	 
	@Override
	public List<Academicdates> findAll() {
		Session session =this.sessionFactory.getCurrentSession();
		List<Academicdates> list = session.createQuery("from Academicdates").list();
		 return list;
	}

	@Override
	public void save(Academicdates academicdates) {
		Session session =this.sessionFactory.getCurrentSession();
		session.save(academicdates);
	}

	@Override
	public Academicdates findOne(int id) {
		 Session session =this.sessionFactory.getCurrentSession();
		 Academicdates academicdates = (Academicdates) session.get(Academicdates.class, id);
		 return academicdates;
	}

	@Override
	public void update(Academicdates academicdates) {
		 Session session =this.sessionFactory.getCurrentSession();
		 session.update(academicdates);
	}

}
