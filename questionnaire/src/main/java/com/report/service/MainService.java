package com.report.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

public interface MainService {

	boolean loginCheck(UserInfoDTO uiDto,HttpSession session);
	UserInfoDTO userOne(UserInfoDTO uiDto);
	List<UserInfoDTO> userList(UserInfoDTO uiDto);
	String insertUser(UserInfoDTO uiDto);
	void delUser(UserInfoDTO uiDto);
	List<UserInfoDTO> dptList(UserInfoDTO uiDto);
	
	
	List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto);
	UntMstInfoDTO mstOne(UntMstInfoDTO umiDto);
	void insertCst(UntMstInfoDTO umiDto);
	void delMst(UntMstInfoDTO umiDto);
	
	
	List<QuestionInfoDTO> questinoList(QuestionInfoDTO qiDto);
	QuestionInfoDTO questionOne(QuestionInfoDTO qiDto);
	void insertQuestion(QuestionInfoDTO qiDto);
	void delQuestion(QuestionInfoDTO qiDto);
	Map<String, Object> chartDate();
	
	
	

}
