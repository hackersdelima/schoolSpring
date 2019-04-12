package com.spring.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExcectionHandler {

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundExcetion() {
		ModelAndView mv= new ModelAndView("error");
		mv.addObject("errorTitle","The Page is not Constructed");
		mv.addObject("errorDescription","The page you are looking for is not available");
		mv.addObject("title","404 Error Page");
		return mv;
	}
	@ExceptionHandler(DataNotFoundException.class)
	public ModelAndView handlerDataNotFoundExcetion() {
		ModelAndView mv= new ModelAndView("error");
		mv.addObject("errorTitle","Data Not Found");
		mv.addObject("errorDescription","The data you are looking for is not available right now");
		mv.addObject("title","Data Unavailable");
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerExcetion(Exception ex) {
		ModelAndView mv= new ModelAndView("error");
		mv.addObject("errorTitle","Contact Your Administrator!");
		mv.addObject("errorDescription",ex.toString());
		mv.addObject("title","Error");
		return mv;
	}
}
