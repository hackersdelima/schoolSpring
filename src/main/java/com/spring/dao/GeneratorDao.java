package com.spring.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public interface GeneratorDao {
	
	public int getmaxid(String tablename);
	
	public String invoiceIdGenerator();
	public String multitransactionidgenerator(String branchid);
}
