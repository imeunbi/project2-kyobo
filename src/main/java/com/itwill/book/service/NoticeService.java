package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.common.NoticeListPageMakerDto;
import com.itwill.book.common.PageMaker;
import com.itwill.book.dao.NoticeDao;
import com.itwill.book.dto.Notice;

public class NoticeService {
	private static NoticeService instance;
	
	private NoticeDao noticeDao;
	public NoticeService() throws Exception{
		noticeDao = new NoticeDao();
	}
	public static NoticeService getInstance() throws Exception{
		if(instance==null) {
			instance = new NoticeService();
		}
		return instance;
	}
	
	
	// 공지사항 목록
	public NoticeListPageMakerDto findNoticeList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = noticeDao.getNoticeCount();
		//2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
		//3.게시물데이타 얻기
		List<Notice> noticeList=
				noticeDao.getNoticeList(pageMaker.getPageBegin(),pageMaker.getPageEnd());
		NoticeListPageMakerDto pageMakerNoticeList=new NoticeListPageMakerDto();
		pageMakerNoticeList.totRecordCount=totalRecordCount;
		pageMakerNoticeList.itemList=noticeList;
		pageMakerNoticeList.pageMaker=pageMaker;
		return pageMakerNoticeList;
	}
	
	// 공지사항 하나 출력
	public Notice noticeSelectByNo(int n_no) throws Exception{
		Notice findNotice = noticeDao.getNoticeDetail(n_no);
		return findNotice;
	}
	
	// 공지사항 전체 출력
	public List<Notice> noticeSelectAll() throws Exception{
		List<Notice> a = new ArrayList<Notice>();
		a= noticeDao.NoticeSelectAll();
		return a;
	}
	
	// 공지사항 조회수 증가
	public void updateviewCount(int noticeNo) throws Exception{
		noticeDao.increaseNoticeReadCount(noticeNo);
	}
}
