package com.spring.dao.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.util.Utilities;

public class MyTestings {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	
	Utilities util=new Utilities();
	
	
	@Test
	public void numToWordTest() {
		logger.info("Number to Word Testing");
		String word=util.numToWordFromJs(100);
		assertTrue(true);
		logger.info(word);
		assertEquals(word, "one hundred");
	}
	

}
