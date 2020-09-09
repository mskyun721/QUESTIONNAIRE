package com.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.report.dto.QuestionMstDTO;

@Controller
public class CustomerController {
	
	
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String customer(Model model,QuestionMstDTO qmDto) {
			
		return "customer";
	}
}
