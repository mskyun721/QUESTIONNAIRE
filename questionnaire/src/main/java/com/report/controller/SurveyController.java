package com.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	
	
	@RequestMapping(value="/addQuestion")
	public String addQuestion() {
		String path ="";
		
		
		path ="survey/addQuestion";
		return path;
	}
}
