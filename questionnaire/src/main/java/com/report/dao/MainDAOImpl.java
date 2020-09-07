package com.report.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public String insertUser(UserInfoDTO uiDto) {
		String result = sqlSession.selectOne(Namespace+".insertUser", uiDto);
		return result;
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

}
