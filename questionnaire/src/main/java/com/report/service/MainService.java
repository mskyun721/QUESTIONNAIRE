package com.report.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

public interface MainService {

	boolean loginCheck(UserInfoDTO uiDto,HttpSession session);
	UserInfoDTO userOne(UserInfoDTO uiDto);
	List<UserInfoDTO> userList(UserInfoDTO uiDto);
	String insertUser(UserInfoDTO uiDto);
	List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto);
	UntMstInfoDTO mstOne(UntMstInfoDTO umiDto);

}
