package com.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DatabaseConnection {
	@Bean
	public DriverManagerDataSource getDataSource() {
		System.out.println("reached datasource");

		DriverManagerDataSource bds = new DriverManagerDataSource();
		bds.setDriverClassName("com.mysql.jdbc.Driver");
		bds.setUrl("jdbc:mysql://localhost:3306/aranikodb");
		bds.setUsername("root");
		bds.setPassword("123456");

		return bds;
	}

}
