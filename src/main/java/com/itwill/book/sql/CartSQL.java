package com.itwill.book.sql;

public class CartSQL {
	
	//카트전체수량체크
	public static final String BOOK_COUNT_BY_ID_NO
	= "select c_qty from cart where u_id=? and b_no=?";

	// 카트넣기 (없으면 insert)
	public static final String CART_INSERT
	= "insert into cart(c_no,c_qty,u_id,b_no) values (cart_c_no_seq.nextval, ?,?,?)";
//	public static final String CART_INSERT_UPDATE
//	= "update cart set c_no=?, c_qty=?, u_id=?, b_no=?";

	//카트넣기(있으면 update)
	public static final String CART_ADD
	= "update cart set c_qty=c_qty+? where u_id=? and b_no=?";
	
	//카트에서 수량변경
	public static final String CART_UPDATE_QTY
	= "update cart set c_qty=? where c_no=?";
	
	//카트 선택 삭제
	public static final String CART_DELETE_BY_CNO
	= "delete from cart where c_no=?";
	//카트 전체삭제
	public static final String CART_DELETE_ALL
	= "delete from cart where u_id=?";
	//카트리스트
	public static final String CART_SELECT_BY_ID
	= "select * from cart c join book b on c.b_no=b.b_no where c.u_id=?"; 
	
	//카트리스트(카트넘버) 주문용
	public static final String CART_SELECT_BY_CNO
	= "select * from cart c join book b on c.b_no=b.b_no where c.c_no=?";


}
