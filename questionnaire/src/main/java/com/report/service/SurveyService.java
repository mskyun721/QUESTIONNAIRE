package com.report.service;

import java.util.Map;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;


public interface SurveyService {

	void insertCustomInfo(QuestionMstDTO qmDto);

	Map<String, Object> queDate();

	void insertResearch(QuestionHisDTO qhDto);

}
