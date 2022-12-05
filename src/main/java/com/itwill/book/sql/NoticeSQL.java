package com.itwill.book.sql;

public class NoticeSQL {
	// 공지사항 모든 데이터 출력
	public final static String NOTICE_SELECT_ALL =
			"select * from notice";
	// 공지사항 번호로 해당 공지사항 출력
	public final static String NOTICE_SELECTBYNO =
			"select * from notice where n_no = ?";
	// 공지사항 조회수 1 증가.
	public final static String NOTICE_READ_COUNT = 
			"update notice set n_views = n_views + 1 WHERE n_no = ?";
	// 공지사항 총 건수 조회, 반환
	public final static String NOTICE_ALL_COUNT =
			"select count(*) from notice";
}
