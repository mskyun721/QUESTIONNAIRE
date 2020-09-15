package com.report.service;

import java.util.List;
import java.util.Map;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;


public interface SurveyService {

	void insertCustomInfo(QuestionMstDTO qmDto);

	Map<String, Object> queDate();

	void insertResearch(QuestionHisDTO qhDto);

	List<QuestionMstDTO> qmList(QuestionMstDTO qmDto);

	List<QuestionHisDTO> detailQuestion(QuestionHisDTO qhDto);

}
