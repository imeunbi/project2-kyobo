package com.itwill.book.sql;

public class BookSQL {
	
	//통합 검색(제목,저자,카테고리)
	public static final String BOOK_SELECT_ALL
	="select * from book where b_name like ? or b_author like ? or b_class like ? or b_publisher like ?";

	public static final String BOOK_SELECT_ALL_LIST
	="select * from (select rownum idx, s.* from (select * from book where b_name like ? or b_author like ? or b_class like ? or b_publisher like ? order by b_name) s) where idx >= ? and idx <= ?";

		//제목 검색
		public static final String BOOK_SELECT_BY_NAME
		="select * from book where b_name like ?";
		
		public static final String BOOK_SELECT_BY_NAME_LIST
		="select * from (select rownum idx, s.* from (select * from book where b_name like ? order by b_name) s) where idx >= ? and idx <= ?";
		
		
		//저자 검색
		public static final String BOOK_SELECT_BY_AUTHOR
		="select * from book where b_author like ?";
		
		public static final String BOOK_SELECT_BY_AUTHOR_LIST
		="select * from (select rownum idx, s.* from (select * from book where b_author like ? order by b_author) s) where idx >= ? and idx <= ?";

		//출판사 검색
				public static final String BOOK_SELECT_BY_PUBLISHER
				="select * from book where b_publisher like ?";
				
				public static final String BOOK_SELECT_BY_PUBLISHER_LIST
				="select * from (select rownum idx, s.* from (select * from book where b_publisher like ? order by b_publisher) s) where idx >= ? and idx <= ?";

				
		//카테고리 검색?
		public static final String BOOK_SELECT_BY_CLASS
		="select * from book where b_class like ?";
		
		public static final String BOOK_SELECT_BY_CLASS_LIST
		="select * from (select rownum idx, s.* from (select * from book where b_class like ? order by b_class) s) where idx >= ? and idx <= ?";

		//도서 리스트
		public static final String BOOK_LIST
		= "select * from book";
		
		public final static String BOOK_LIST_PAGE 
		="select * from (select rownum idx, s.* from (select * from book order by b_name) s) where idx >= ? and idx <= ?";
		
		//번호 검색
		public static final String BOOK_SELECT_BY_NO
		="select * from book where b_no=?";
		
}
