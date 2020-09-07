package com.report.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.report.dao.MainDAO;
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
	public List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto) {
		List<UntMstInfoDTO> mstList = mainDao.mstList(umiDto);
		return mstList;
	}
	@Override
	public UntMstInfoDTO mstOne(UntMstInfoDTO umiDto) {
		UntMstInfoDTO mstOne = mainDao.mstOne(umiDto);
		return mstOne;
	}
	

}
