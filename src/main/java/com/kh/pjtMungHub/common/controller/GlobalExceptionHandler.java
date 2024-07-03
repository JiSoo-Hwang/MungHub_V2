package com.kh.pjtMungHub.common.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kh.pjtMungHub.wedding.aop.AccessRestrictedException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(AccessRestrictedException.class)
	public String handleAccessRestrictedException(AccessRestrictedException ex, Model model) {
		model.addAttribute("alertMsg",ex.getMessage());
		return "/";
	}
}
