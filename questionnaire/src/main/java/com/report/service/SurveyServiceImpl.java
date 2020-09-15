package com.report.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.report.dao.SurveyDAO;
import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;

@Service
public class SurveyServiceImpl implements SurveyService {
	Calendar cal = Calendar.getInstance();
	@Inject
	SurveyDAO surveyDao;
	
	public Map<String,Object> queDate(){
		Map<String,Object> dateMap = new HashMap<String, Object>();
		
		int year,month,day = 0;
		year=cal.get(Calendar.YEAR);
		month=cal.get(Calendar.MONTH)+1;
		day=cal.get(Calendar.DATE);
		String strMonth, strDay = "";
		if (month<10) {strMonth = "0"+month;}else {strMonth=month+"";}
		if (day<10) {strDay = "0"+day;}else {strDay=day+"";}
		String date = year+"-"+strMonth+"-"+strDay;
		
		String firstDate = year+"-"+strMonth+"-01";
		
		dateMap.put("date", date);
		dateMap.put("firstDate", firstDate);
		
		return dateMap;
	}
	
	@Override
	public void insertCustomInfo(QuestionMstDTO qmDto) {
		surveyDao.insertCustomInfo(qmDto);
	}
	@Override
	public void insertResearch(QuestionHisDTO qhDto) {
		surveyDao.insertResearch(qhDto);
	}
	@Override
	public List<QuestionMstDTO> qmList(QuestionMstDTO qmDto) {
		List<QuestionMstDTO> qmList = surveyDao.qmList(qmDto);
		return qmList;
	}
	@Override
	public List<QuestionHisDTO> detailQuestion(QuestionHisDTO qhDto) {
		List<QuestionHisDTO> detailQuestion = surveyDao.detailQuestion(qhDto);
		return detailQuestion;
	}
}
