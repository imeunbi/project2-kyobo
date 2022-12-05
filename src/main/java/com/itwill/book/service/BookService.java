package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.common.PageMaker;
import com.itwill.book.dao.BookDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.PageMakerDto;


public class BookService {
	private BookDao bookDao;
	//private static BookService _instance;

	public BookService() throws Exception{
		bookDao=new BookDao();
	}
	
	//리스트
	public PageMakerDto<Book> getBookList(int currentPage) throws Exception {
		// 전체 글 개수
		int totRecordCount = bookDao.getTotBookCount();
		
		// 페이지 계산
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 8, 5);
		
		// 게시물 데이터 얻기
		List<Book> bookList = bookDao.getList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		
		return pageMakerBookList;
	}
	
	//리스트
	/*
	public List<Book> selectList()throws Exception{
		List<Book> bookList= bookDao.selectList();
		return bookList;
	}
*/
	//번호검색
	public Book selectByNo(int b_no)throws Exception{
		Book book= bookDao.selectByNo(b_no);
		return book;
	}

	//제목 검색
	public ArrayList<Book> selectByName(String b_name) throws Exception{
		return bookDao.selectByName(b_name);
	}
	//제목 검색 페이지
	public PageMakerDto<Book> selectByName(String keyword, int currentPage) throws Exception {
		int totRecordCount = bookDao.selectByName(keyword).size();
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 3, 5);
		List<Book> bookList = bookDao.selectByName(keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		System.out.println(bookList);
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		System.out.println(pageMakerBookList.itemList);
		return pageMakerBookList;
	}
	
	//저자 검색(2개 이상)
	public ArrayList<Book> selectByAuthor(String b_author) throws Exception{
		return bookDao.selectByAuthor(b_author);
	}
	//저자 검색 페이지
	public PageMakerDto<Book> selectByAuthor(String keyword, int currentPage) throws Exception {
		int totRecordCount = bookDao.selectByAuthor(keyword).size();
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 3, 5);
		List<Book> bookList = bookDao.selectByAuthor(keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());		
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		
		return pageMakerBookList;
	}

	//카테고리 검색
	public ArrayList<Book> selectByClass(String b_class) throws Exception{
		return bookDao.selectByClass(b_class);
	}
	//카테고리 검색 페이지
	public PageMakerDto<Book> selectByClass(String keyword, int currentPage) throws Exception {
		int totRecordCount = bookDao.selectByClass(keyword).size();
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 3, 5);
		List<Book> bookList = bookDao.selectByClass(keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());		
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		
		return pageMakerBookList;
	}
	//출판사 검색
	public ArrayList<Book> selectByPublisher(String b_publisher) throws Exception{
		return bookDao.selectByPublisher(b_publisher);
	}
	//출판사 검색 페이지
	public PageMakerDto<Book> selectByPublisher(String keyword, int currentPage) throws Exception {
		int totRecordCount = bookDao.selectByPublisher(keyword).size();
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 3, 5);
		List<Book> bookList = bookDao.selectByPublisher(keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());		
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		
		return pageMakerBookList;
	}
	

	//통합검색
	public ArrayList<Book> selectByAll(String keyword) throws Exception{
		return bookDao.selectByAll(keyword);
	}
	
	//통합검색페이지
	public PageMakerDto<Book> selectByAll(String keyword, int currentPage) throws Exception {
		int totRecordCount = bookDao.selectByAll(keyword).size();
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage, 3, 5);
		List<Book> bookList = bookDao.selectByAll(keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());		
		PageMakerDto<Book> pageMakerBookList = new PageMakerDto<Book>(bookList, pageMaker, totRecordCount);
		
		return pageMakerBookList;
	}
}
