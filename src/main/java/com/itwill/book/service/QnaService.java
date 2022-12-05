package com.itwill.book.service;

import java.util.List;

import com.itwill.book.common.PageMaker;
import com.itwill.book.dao.QnaDao;
import com.itwill.book.dto.Qna;
import com.itwill.book.dto.QnaPageMakerDto;


public class QnaService {
	private static QnaService _instance;

	private QnaDao qnaDao;

	public QnaService() throws Exception {
		qnaDao = new QnaDao();
	}

	public static QnaService getInstance() throws Exception {
		if (_instance == null) {
			_instance = new QnaService();
		}
		return _instance;
	}

	public int create(Qna qna) throws Exception {
		return qnaDao.insert(qna);
	}

	// 리뷰댓글작성
	public int createReply(Qna qna) throws Exception {
		return qnaDao.reinsert(qna);
	}

	// 리뷰수정
	public int updateByNo(Qna qna) throws Exception {
		return qnaDao.update(qna);
	}

	// 리뷰삭제
	public int deleteByNo(int q_no, String u_id) throws Exception {
		return qnaDao.deleteByNoId(q_no, u_id);
	}

	// 리뷰 번호로 리뷰조회 - 상품페이지 리뷰상세, 마이페이지 리뷰상세
	public Qna selectByNo(int q_no) throws Exception {
		return qnaDao.selectByNo(q_no);
	}

	// 회원 아이디로 리뷰 조회 - 마이페이지
	public List<Qna> selectById(String u_id, int start, int last) throws Exception {
		return qnaDao.selectById(u_id, start, last);
	}

	//게시물 리스트
	public QnaPageMakerDto selectAll(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = qnaDao.QnaCountAll(); // 다시확인
		//2.paging계산(PageMaker 유틸클래스)
		
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
		//3.게시물데이타 얻기
		List<Qna> qnaList=
				qnaDao.selectAll(pageMaker.getPageBegin(),
										pageMaker.getPageEnd());
		
		QnaPageMakerDto pageMakerReviewList=new QnaPageMakerDto();
		pageMakerReviewList.totRecordCount=totalRecordCount;
		pageMakerReviewList.itemList=qnaList;
		pageMakerReviewList.pageMaker=pageMaker;
		return pageMakerReviewList;
	}

}
