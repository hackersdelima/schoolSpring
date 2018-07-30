package com.spring.dao;

import java.sql.Connection;

public interface DateConverterDao {
	public String nepaliToEnglish(String nepaliDate);
	 public String englishToNepali(String englishDate);
}
