package com.spring.exceptions;

import java.io.Serializable;

public class DataNotFoundException extends Exception implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private String message;
	
	public DataNotFoundException() {
		this("Data Not Found Exception");
	}
	
	public DataNotFoundException(String message ) {
		this.message=System.currentTimeMillis()+": "+message;
	}

	public String getMessage() {
		return message;
	}

	 
	
}

