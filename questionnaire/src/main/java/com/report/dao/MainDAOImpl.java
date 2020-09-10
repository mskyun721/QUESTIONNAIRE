package com.report.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

@Repository
public class MainDAOImpl implements MainDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.report.mappers.MainMapper";
	
	@Override
	public UserInfoDTO logincheck(UserInfoDTO uiDto) {
		UserInfoDTO loginUser = sqlSession.selectOne(Namespace+".loginCheck", uiDto);
		return loginUser;
	}
	@Override
	public List<UserInfoDTO> userList(UserInfoDTO uiDto) {
		List<UserInfoDTO> userList = sqlSession.selectList(Namespace+".userList", uiDto);
		return userList;
	}
	@Override
	public List<UserInfoDTO> dptList(UserInfoDTO uiDto) {
		List<UserInfoDTO> dptList = sqlSession.selectList(Namespace+".dptList", uiDto);
		return dptList;
	}
	@Override
	public String insertUser(UserInfoDTO uiDto) {
		String result = sqlSession.selectOne(Namespace+".insertUser", uiDto);
		return result;
	}
	@Override
	public void delUser(UserInfoDTO uiDto) {
		sqlSession.delete(Namespace+".delUser",uiDto);
	}
	
	
	
	
	@Override
	public List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto) {
		List<UntMstInfoDTO> mstList = sqlSession.selectList(Namespace+".mstList", umiDto);
		return mstList;
	}
	@Override
	public UntMstInfoDTO mstOne(UntMstInfoDTO umiDto) {
		UntMstInfoDTO mstOne = sqlSession.selectOne(Namespace+".mstOne",umiDto);
		return mstOne;
	}
	@Override
	public void insertCst(UntMstInfoDTO umiDto) {
		sqlSession.insert(Namespace+".insertCst",umiDto);
	}
	@Override
	public void delMst(UntMstInfoDTO umiDto) {
		sqlSession.delete(Namespace+".delMst",umiDto);
	}
	
	
	
	@Override
	public List<QuestionInfoDTO> questionList(QuestionInfoDTO qiDto) {
		List<QuestionInfoDTO> questionList = sqlSession.selectList(Namespace+".questionList",qiDto);
		return questionList;
	}
	@Override
	public QuestionInfoDTO questionOne(QuestionInfoDTO qiDto) {
		QuestionInfoDTO questionOne = sqlSession.selectOne(Namespace+".questionOne",qiDto);
		return questionOne;
	}
	@Override
	public void insertQuestion(QuestionInfoDTO qiDto) {
		sqlSession.insert(Namespace+".insertQuestion",qiDto);
	}
	@Override
	public void delQuestion(QuestionInfoDTO qiDto) {
		sqlSession.delete(Namespace+".delQuestion",qiDto);
	}

}
