package com.spring.util;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.service.GeneratorService;

public class Generator {
	
	@Autowired
	GeneratorService generatorService;
	
	
	public String idGenerator(String prefix, String tablename) {
		int maxid =generatorService.getmaxid(tablename);
		String generatedId = prefix+Integer.toString(maxid)+1;
		return generatedId;
	}

}
