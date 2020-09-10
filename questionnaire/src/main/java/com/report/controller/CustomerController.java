package com.report.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.QuestionMstDTO;
import com.report.service.MainService;
import com.report.service.SurveyService;


@Controller
public class CustomerController {
	
	
	@Inject
	SurveyService surveyService;
	@Inject
	MainService mainService;
	
	@RequestMapping(value = "/survey/customer", method = RequestMethod.GET)
	public String customer(Model model,QuestionMstDTO qmDto) {
			
		return "survey/customer";
	}
	
	@RequestMapping(value = "/survey/research", method = RequestMethod.POST)
	public String research(Model model,QuestionMstDTO qmDto, HttpSession session) {
		Map<String,Object> dateMap = surveyService.queDate();
		qmDto.setQUEDATE(dateMap.get("date").toString());
		
		surveyService.insertCustomInfo(qmDto);
		
		QuestionInfoDTO qiDto = new QuestionInfoDTO();
		if(session.getAttribute("untcd") != null) {
			qiDto.setUNTCD(session.getAttribute("untcd").toString());
		}else {
			qiDto.setUNTCD(qmDto.getUNTCD());
		}
		
		qiDto.setUSETYPE("Y");
		qiDto.setOrderType("1");
		List<QuestionInfoDTO> questionList = mainService.questinoList(qiDto);
		model.addAttribute("listCount",questionList.size());
		model.addAttribute("questionList", questionList);
		return "survey/research";
	}
	
	
	
	
	
	
}
