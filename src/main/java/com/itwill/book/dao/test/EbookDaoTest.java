package com.itwill.book.dao.test;

import java.util.List;

import com.itwill.book.dao.EbookDao;
import com.itwill.book.dao.EorderDao;
import com.itwill.book.dto.Ebook;
import com.itwill.book.dto.Eorder;

public class EbookDaoTest {

	public static void main(String[] args) throws Exception{
		EbookDao ebookDao = new EbookDao();
		EorderDao eorderDao = new EorderDao();
		List<Eorder> eorder = eorderDao.selectById("seongmin");
		System.out.println(eorder);
		long a = eorderDao.remaintime("seongmin", 1);
		System.out.println(a/(1000*60*60*24));
		System.out.println(ebookDao.selectByNo(1));
		/*
		int rowCount = eorderDao.insert(3, "enbi");
		System.out.println("주문여부 : " + rowCount);
		long b = eorderDao.remaintime("enbi", 2);
		System.out.println("구매 후 남은 시간 : "+b);
		*/
		int rowCount = eorderDao.update(2, "enbi");
		System.out.println(rowCount);
		long b = eorderDao.remaintime("enbi", 2);
		System.out.println("재구매 후 남은시간"+b);
		
		System.out.println("삭제여부:" +eorderDao.delete(2, "enbi"));
		
		
	}

}
