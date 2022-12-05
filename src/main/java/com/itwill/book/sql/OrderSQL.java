package com.itwill.book.sql;

public class OrderSQL {
	
	//Order Insert
	public static final String ORDER_INSERT =
			"insert into orders values(orders_o_no_seq.nextval, sysdate, ?, ?)";
	//OrderDetail Insert
	public static final String ORDER_DETAIL_INSERT =
			"insert into orderdetail values(orderdetail_od_no_seq.nextval, ?, orders_o_no_seq.currval,?)";
	
	//o_no로 주문내역 삭제
	public static final String ORDER_DELETE_BY_O_NO =
			"delete from orders where o_no = ?";
	//u_id로 주문내역 전체삭제
	public static final String ORDER_DELETE_ALL_BY_U_ID =
			"delete from orders where u_id = ?";
	
	//회원 주문내역 출력
	public static final String ORDER_SELECT_ALL_BY_U_ID =
			"select * from orders where u_id = ?";
	
	//회원 주문번호로 주문내역 출력
	public static final String ORDER_SELECT_BY_U_NO =
			"select * from orders o join orderdetail od on o.o_no = od.o_no join book b on od.b_no = b.b_no where o.u_id = ? and o.o_no =?";
	
}
 