package com.report.dao;

import java.util.List;

import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;

public interface MainDAO {

	UserInfoDTO logincheck(UserInfoDTO uiDto);

	List<UserInfoDTO> userList(UserInfoDTO uiDto);

	String insertUser(UserInfoDTO uiDto);

	List<UntMstInfoDTO> mstList(UntMstInfoDTO umiDto);

	UntMstInfoDTO mstOne(UntMstInfoDTO umiDto);

}
