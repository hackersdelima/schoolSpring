package com.spring.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class DemoAspect {
	@Before("execution(public String login(*) ")
	public void beforeAspect()
	{
		System.out.println("Before Aspect Called");
	}

}
