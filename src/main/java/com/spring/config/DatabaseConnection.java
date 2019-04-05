package com.spring.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConnection {
	
	 @Autowired
	   private Environment env;
	
	  @Bean
	    public LocalSessionFactoryBean sessionFactory() {
		  System.out.println("reached Hibernate Datasource");
	        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource());
	        sessionFactory.setPackagesToScan("com.spring.model");
	        sessionFactory.setHibernateProperties(hibernateProperties());
	 
	        return sessionFactory;
	    }
	 
	    @Bean
	    public DataSource dataSource() {
	        BasicDataSource dataSource = new BasicDataSource();
	        dataSource.setDriverClassName("com.mysql.jdbc.Driver");

	        dataSource.setUrl("jdbc:mysql://localhost:3306/aranikodb");

	        dataSource.setUsername("root");
	       // dataSource.setPassword("123456");
	        dataSource.setPassword("DigCen@1Pep");
	 
	        return dataSource;
	    }
	 
	    @Bean
	    public PlatformTransactionManager hibernateTransactionManager() {
	        HibernateTransactionManager transactionManager
	          = new HibernateTransactionManager();
	        transactionManager.setSessionFactory(sessionFactory().getObject());
	        return transactionManager;
	    }
	 
	    private final Properties hibernateProperties() {
	        Properties hibernateProperties = new Properties();
	        hibernateProperties.setProperty(
	          "hibernate.hbm2ddl.auto", "update");
	        hibernateProperties.setProperty(
	          "hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
	 
	        return hibernateProperties;
	    }
	
}
