package com.report.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.report.dto.QuestionHisDTO;
import com.report.dto.QuestionMstDTO;

@Repository
public class SurveyDAOImpl implements SurveyDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.report.mappers.SurveyMapper";
	
	@Override
	public void insertCustomInfo(QuestionMstDTO qmDto) {
		sqlSession.insert(Namespace+".insertCustomInfo",qmDto);
	}
	@Override
	public void insertResearch(QuestionHisDTO qhDto) {
		sqlSession.insert(Namespace+".insertResearch", qhDto);
	}
}
