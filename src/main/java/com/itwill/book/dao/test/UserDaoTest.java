package com.itwill.book.dao.test;

import com.itwill.book.dao.UserInfoDao;
import com.itwill.book.dto.UserInfo;
import com.itwill.book.service.UserInfoService;

public class UserDaoTest {
	public static void main(String[] args)throws Exception {
		UserInfoDao userDao = new UserInfoDao();
		UserInfo user = new UserInfo("test1", "1234", "테스터", "0101245784", "950101", "남", "test@naver.com", "서울");
		
		/*System.out.println("insert");
		System.out.println(userDao.insert(user));
		user = new UserInfo("test1", "1234", "테스터", "0109876543", "950101", "남", "test2@naver.com", "서울");
		System.out.println("update");
		System.out.println(userDao.update(user));
		
		System.out.println("delete");
		System.out.println(userDao.deleteById("test1"));*/
		System.out.println("select by all");
		System.out.println(userDao.selectAll());
		System.out.println("select by id");
		System.out.println(userDao.selectById("seongmin"));
		
		UserInfoService userInfoService = new UserInfoService();
		System.out.println(userInfoService.create(user));
		
	}
}
