package com.report.dao;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;

public interface SurveyDAO {

	void insertCustomInfo(QuestionMstDTO qmDto);

	void insertResearch(QuestionHisDTO qhDto);

}
