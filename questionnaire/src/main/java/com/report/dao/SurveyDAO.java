package com.report.dao;

import java.util.List;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;

public interface SurveyDAO {

	void insertCustomInfo(QuestionMstDTO qmDto);

	void insertResearch(QuestionHisDTO qhDto);

	List<QuestionMstDTO> qmList(QuestionMstDTO qmDto);

	List<QuestionHisDTO> detailQuestion(QuestionHisDTO qhDto);

	int qmCount(QuestionMstDTO qmDto);


}
