package com.report.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;
import com.report.service.MainService;

@RestController
public class RestfullController {
	@Inject
	MainService mainService;
	
	@RequestMapping(value="/delUser", method=RequestMethod.GET)
	public void delUser(UserInfoDTO uiDto)	{
		mainService.delUser(uiDto);
	}
	
	@RequestMapping(value="/delMst", method=RequestMethod.GET)
	public void delMst(UntMstInfoDTO umiDto){
		mainService.delMst(umiDto);
	}
	@RequestMapping(value="survey/delQuestion", method=RequestMethod.GET)
	public void delQuestion(QuestionInfoDTO qiDto){
		mainService.delQuestion(qiDto);
	}
}
