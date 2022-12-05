package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.UserInfoDao;
import com.itwill.book.dto.UserInfo;


public class UserInfoService {

	private UserInfoDao userDao;
	public UserInfoService() throws Exception{
		userDao = new UserInfoDao();
	}

	public int create(UserInfo user)throws Exception {
		/*
		 * 0: 오류
		 * 1: 생성
		 * 2: 아이디중복
		 */
		if(!(userDao.existUserId(user.getU_id()) == null)) {
			return 2;
		}
		return userDao.insert(user);
	}
	
	public int login(String id, String password)throws Exception {
		/*
		 * 0: 아이디 존재하지않음
		 * 1: 로그인
		 * 2: 패스워드 불일치
		 */
		UserInfo userInfo = userDao.selectById(id);
		if(userInfo == null) {
			return 0;
		}
		if(!userInfo.getU_password().equals(password)) {
			return 2;
		}
		return 1;
	}
	
	public int update(UserInfo user)throws Exception {
		return userDao.update(user);
	}
	
	public int remove(String id) throws Exception{
		return userDao.deleteById(id);
	}
	
	public UserInfo selectById(String id)throws Exception {
		return userDao.selectById(id);
	}
	
	public List<UserInfo> selectAll()throws Exception {
		return userDao.selectAll();
	}
}
