package com.report.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionInfoDTO;
import com.report.dto.QuestionMstDTO;
import com.report.service.MainService;
import com.report.service.SurveyService;


@Controller
public class SurveyController {
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
		List<QuestionInfoDTO> questionList = mainService.questinoList(qiDto);
		model.addAttribute("listCount",questionList.size());
		model.addAttribute("questionList", questionList);
		return "survey/research";
	}
	
	@RequestMapping(value = "/survey/queResult", method = RequestMethod.GET)
	public String queResult(Model model,QuestionMstDTO qmDto,HttpSession session,QuestionHisDTO qhDto) {
		String path="";
		if(session.getAttribute("userID") == null) {
			path="redirect:/";
		}else {
		Map<String, Object> map = surveyService.queDate();
		List<QuestionHisDTO> qhList = null;
		String sessionID = session.getAttribute("userID").toString();
		if(sessionID.equals("sunsoft")) {
			qmDto.setUSERID(sessionID);
		}else {
			qmDto.setUNTCD(session.getAttribute("untcd").toString());
		}
		if(qmDto.getSTDATE() == null) {
			qmDto.setSTDATE(map.get("firstDate").toString());
			qmDto.setLTDATE(map.get("date").toString());
		}
		List<QuestionMstDTO> qmList = surveyService.qmList(qmDto);
		if (qhDto.getUNTCD() != null && qhDto.getQUEDATE() != null && qhDto.getQUEHPNO() != null) {
			qhList = surveyService.detailQuestion(qhDto);
		}
		
		model.addAttribute("qhList",qhList);
		model.addAttribute("qmList",qmList);
		model.addAttribute("stdate",map.get("firstDate"));
		model.addAttribute("ltdate",map.get("date"));
		path = "survey/queResult";
		}
		return path;
	}
	
	
	
	
}
