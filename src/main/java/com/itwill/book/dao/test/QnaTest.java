package com.itwill.book.dao.test;

import com.itwill.book.dao.QnaDao;
import com.itwill.book.dto.Qna;

public class QnaTest {
	public static void main(String[] args) throws Exception{
		QnaDao qnaDao = new QnaDao();
		
		System.out.println(qnaDao.selectByNo(1));
		System.out.println(qnaDao.selectById("enbi",1,10));
		
		/*Qna qna = new Qna(0, "제품문의", "테스트", null, "테스트중", "seongmin",0,0,0);
		System.out.println("insert");
		System.out.println(qnaDao.insert(qna));
		System.out.println("update");
		qna = new Qna(6, "제품문의", "테스트2", null, "테스트중2", "bongkyoun",6,1,0);
		System.out.println(qnaDao.update(qna));
		System.out.println("delete");
		System.out.println(qnaDao.deleteByNoId(9, "seongmin"));*/
		
		Qna qna = new Qna(0, "답글", "답글제목", null, "테스트중", "seongmin",4,1,0);
		
		qnaDao.reinsert(qna);
		qnaDao.selectAll(1, 10);
		
		
	}
}
