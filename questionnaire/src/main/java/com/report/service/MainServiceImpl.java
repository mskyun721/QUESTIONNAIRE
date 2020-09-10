package com.report.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.report.dao.MainDAO;
import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

@Service
public class MainServiceImpl implements MainService {
	@Inject
	MainDAO mainDao;

	@Override
	public boolean loginCheck(UserInfoDTO uiDto,HttpSession session) {
		boolean result = false;
		UserInfoDTO loginUser = mainDao.logincheck(uiDto);
		if(loginUser != null)
		{
			result = true;
			session.setAttribute("userID", loginUser.getUSERID());
			session.setAttribute("userNM", loginUser.getEMPNM());
			session.setAttribute("untcd", loginUser.getUNTCD());
		}
		
		return result;
	}
	@Override
	public List<UserInfoDTO> userList(UserInfoDTO uiDto) {
		List<UserInfoDTO> userList = mainDao.userList(uiDto);
		return userList;
	}
	@Override
	public List<UserInfoDTO> dptList(UserInfoDTO uiDto) {
		List<UserInfoDTO> dptList = mainDao.dptList(uiDto);
		return dptList;
	}
	@Override
	public UserInfoDTO userOne(UserInfoDTO uiDto) {
		UserInfoDTO loginUser = mainDao.logincheck(uiDto);
		return loginUser;
	}
	
	@Override
	public String insertUser(UserInfoDTO uiDto) {
		String result = mainDao.insertUser(uiDto);
		return result;
	}
	@Override
	public void delUser(UserInfoDTO uiDto) {
		mainDao.delUser(uiDto);
	}
	
	
	
	@Override
	public List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto) {
		List<UntMstInfoDTO> mstList = mainDao.mstList(umiDto);
		return mstList;
	}
	@Override
	public UntMstInfoDTO mstOne(UntMstInfoDTO umiDto) {
		UntMstInfoDTO mstOne = mainDao.mstOne(umiDto);
		return mstOne;
	}
	@Override
	public void insertCst(UntMstInfoDTO umiDto) {
		mainDao.insertCst(umiDto);
	}
	@Override
	public void delMst(UntMstInfoDTO umiDto) {
		mainDao.delMst(umiDto);
	}
	
	
	
	@Override
	public List<QuestionInfoDTO> questinoList(QuestionInfoDTO qiDto) {
		List<QuestionInfoDTO> questionList = mainDao.questionList(qiDto);
		return questionList;
	}
	@Override
	public QuestionInfoDTO questionOne(QuestionInfoDTO qiDto) {
		QuestionInfoDTO questionOne = mainDao.questionOne(qiDto);
		return questionOne;
	}
	@Override
	public void insertQuestion(QuestionInfoDTO qiDto) {
		mainDao.insertQuestion(qiDto);
	}
	@Override
	public void delQuestion(QuestionInfoDTO qiDto) {
		mainDao.delQuestion(qiDto);
	}

}
