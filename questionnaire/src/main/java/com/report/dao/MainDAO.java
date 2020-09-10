package com.report.dao;

import java.util.List;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

public interface MainDAO {

	UserInfoDTO logincheck(UserInfoDTO uiDto);

	List<UserInfoDTO> userList(UserInfoDTO uiDto);
	List<UserInfoDTO> dptList(UserInfoDTO uiDto);
	String insertUser(UserInfoDTO uiDto);
	void delUser(UserInfoDTO uiDto);
	
	

	List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto);

	UntMstInfoDTO mstOne(UntMstInfoDTO umiDto);

	void insertCst(UntMstInfoDTO umiDto);
	void delMst(UntMstInfoDTO umiDto);
	
	

	List<QuestionInfoDTO> questionList(QuestionInfoDTO qiDto);

	QuestionInfoDTO questionOne(QuestionInfoDTO qiDto);

	void insertQuestion(QuestionInfoDTO qiDto);

	void delQuestion(QuestionInfoDTO qiDto);

	

	

	

}
