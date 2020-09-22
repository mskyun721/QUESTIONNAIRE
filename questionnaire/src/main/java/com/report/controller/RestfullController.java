package com.report.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.WriterException;
import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;
import com.report.service.MainService;
import com.report.service.QRCodeUtils;
import com.report.service.SurveyService;

@RestController
public class RestfullController {
	@Inject
	MainService mainService;
	@Inject
	SurveyService surveyService;
	@Inject
	QRCodeUtils qrUtils;
	
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
	@RequestMapping(value="survey/insertResearch", method=RequestMethod.GET)
	public void insertResearch(QuestionHisDTO qhDto,HttpSession session){
		String[] arrQueinType = qhDto.getQUEINTYPE().split("/");
		String[] arrQueremark = qhDto.getQUEREMARK().split("/");
		QuestionInfoDTO qiDto = new QuestionInfoDTO();
		if(session.getAttribute("untcd") != null) {qiDto.setUNTCD(session.getAttribute("untcd").toString());}
		else {qiDto.setUNTCD(qhDto.getUNTCD());}
		qiDto.setUSETYPE("Y");
		List<QuestionInfoDTO> questionList = mainService.questinoList(qiDto);
		Map<String,Object> dateMap = surveyService.queDate();
		
		for (int i = 0; i < questionList.size(); i++) {
			
			qhDto.setQUEINTYPE(arrQueinType[i]);
			qhDto.setQUEREMARK(arrQueremark[i]);
			qhDto.setQUEHISSEQ(questionList.get(i).getQUENO());
			qhDto.setQUECONT(questionList.get(i).getQUECONT());
			qhDto.setQUEDATE(dateMap.get("date").toString());
			surveyService.insertResearch(qhDto);
		}
	}
	
	@RequestMapping(value="/QrCode/{untcd}", method=RequestMethod.GET)
	public void QRCode(HttpServletResponse response, Model model,@PathVariable("untcd") String untcd) {
		
		try {
			ServletOutputStream sos = response.getOutputStream();
			
			qrUtils.QRcodeSet("http://sunsoft.codns.com:9009/?UNTCD="+untcd, 300, 300, sos);
			sos.flush();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
	    String QRsrc = "?width=150&height=150&text=http://sunsoft.codns.com?UNTCD="+untcd;
	    model.addAttribute("QRsrc",QRsrc);
	    
	}
	
	@RequestMapping(value="survey/detailQuestion", method=RequestMethod.GET)
	public List<QuestionHisDTO> detailQuestion(QuestionHisDTO qhDto) {
		System.out.println(qhDto.getQUEDATE());
		List<QuestionHisDTO> detailQuestion = surveyService.detailQuestion(qhDto);
		
		return detailQuestion;
	    
	}
	
}
