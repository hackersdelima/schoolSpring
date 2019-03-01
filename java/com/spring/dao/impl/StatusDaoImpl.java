package com.spring.dao.impl;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.StatusDao;
import com.spring.model.Status;

@Repository
@Transactional
public class StatusDaoImpl implements StatusDao{
	
 private SessionFactory sessionFactory;
	 
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
	    }
	 
	 public List<Status> findAll(){
		 Session session =this.sessionFactory.getCurrentSession();
		 List<Status> status = session.createQuery("from Status").list();
		 return status;
	 }
	 
	 public void save(Status status) {
		 Session session =this.sessionFactory.getCurrentSession();
		  session.saveOrUpdate(status);
		 
	 }


	@Override
	public Status findById(int id) {
		 Session session =this.sessionFactory.getCurrentSession();
		 Status status = (Status) session.get(Status.class, id);
		 return status;
	}


	@Override
	public void update(Status status) {
		 Session session =this.sessionFactory.getCurrentSession();
		 session.update(status);
	}
	
	@Override
	public void saveOrUpdate(Status status) {
		 Session session =this.sessionFactory.getCurrentSession();
		 session.saveOrUpdate(status);
	}

	@Override
	public void delete(Status status) {
		Session session =this.sessionFactory.getCurrentSession();
		session.delete(status);
	}

}
