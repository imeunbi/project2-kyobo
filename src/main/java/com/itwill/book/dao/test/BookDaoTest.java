package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dto.Book;

public class BookDaoTest {

	public static void main(String[] args) throws Exception{
		BookDao bookDao=new BookDao();

		
		//전체리스트
		System.out.println("1.리스트");
		//System.out.println(bookDao.selectList());
		/* 전체 리스트
		 * ArrayList<Book> totBookList = bookDao.getBookList(); for (Book book :
		 * totBookList) { System.out.println(book); }
		 */
		
			
		
		//통합 검색
		System.out.println("2.통합 검색");
		ArrayList<Book> bookList = bookDao.selectByAll("이유");
		for (Book book2 : bookList) {
			System.out.println(book2);
		}
		

		//번호 검색
		System.out.println("3.번호 검색");
		System.out.println(bookDao.selectByNo(17));
		
		//제목 검색
		System.out.println("4.제목 검색");
		bookList = bookDao.selectByName("마"); 
		for (Book book2 : bookList) {
			System.out.println(book2); }
		
				
		//저자 검색
		System.out.println("5.저자 검색");
		bookList = bookDao.selectByAuthor("한복선");
		for (Book book2 : bookList) {
			System.out.println(book2);
		}
		
		
		//분야 검색
		System.out.println("6.분야 검색");
		bookList = bookDao.selectByClass("공포");
		for (Book book2 : bookList) {
			System.out.println(book2);
		}
		
		
		/* properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"))> 경로수정
		 * 
		 * Exception in thread "main" java.lang.NullPointerException
			at java.util.Properties$LineReader.readLine(Properties.java:434)
			at java.util.Properties.load0(Properties.java:353)
			at java.util.Properties.load(Properties.java:341)
			at book.BookDao.<init>(BookDao.java:20)
			at book.BookDaoTestMain.main(BookDaoTestMain.java:10)
		 */

		
		
	}

}
