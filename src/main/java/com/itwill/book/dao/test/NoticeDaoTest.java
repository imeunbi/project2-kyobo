package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;

public class NoticeDaoTest {

	public static void main(String[] args) throws Exception{
		
		NoticeDao noticeDao = new NoticeDao();
		List<Notice> noticeList = new ArrayList<Notice>();
		
		
		/*
		System.out.println("---공지사항 전체 출력--- 작동함"); 
		noticeList = noticeDao.NoticeSelectAll();
		System.out.println(noticeList);
		*/
		/*
		System.out.println("---공지사항 목록 조회--- 작동함");
		noticeList = noticeDao.getNoticeList(1,3);
		for(Notice notice : noticeList)
			System.out.println(notice);
		*/
		/*
		System.out.println("---공지사항 상세 조회--- 작동함");
		System.out.println(noticeDao.getNoticeDetail(1));
		*/
		/*
		System.out.println("---공지사항 조회수 증가--- 작동함");
		noticeDao.increaseNoticeReadCount(1);
		System.out.println(noticeDao.getNoticeDetail(1));
		*/
		/*
		System.out.println("---공지사항 총 개수 조회--- 작동함");
		System.out.println(noticeDao.getNoticeCount());
		*/
	}

}
