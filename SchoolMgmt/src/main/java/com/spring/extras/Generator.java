package com.spring.extras;

public class Generator {
	public String addHash(String givenValue){
		String[] str=givenValue.split(",");
		String result=null;
		String b="";
		for(int i=0;i<str.length;i++){
			result="#"+str[i];
			b=result+","+b;
		}
		if(b!=null){
			 givenValue=b.substring(0, b.length() - 1);
			 return givenValue;
		}
		return null;
	}

}
