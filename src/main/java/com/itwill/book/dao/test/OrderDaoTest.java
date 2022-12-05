package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;

public class OrderDaoTest {

	public static void main(String[] args) throws Exception{
		 OrderDao orderDao = new OrderDao();
		 CartDao cartDao = new CartDao();
		 BookDao bookDao = new BookDao();
		 
		 /*
		  * orders 객체에 List<orderdetail>이 있고
		  * orderdetail에는 book 객체가 필요하다.
		  * 
		  *  1. bookDao에서 book 객체를 select로 가져온다.
		  *  2. orderdetial select all로 List<orderdetail>을 끌고온다.
		  *  3. orders 객체에 넣는다.
		  *  4. 만든 객체로 insert 해본다.
		  */
		 //상품에서 주문 1번 책 3개
		 /*
		 List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>(); 
		 Book bookByNo = bookDao.selectByNo(1); // 책번호 1번
		 orderDetailList.add(new OrderDetail(0, 3, 0, bookByNo)); // 책 수량 3개
		 
		 Orders order = new Orders(0, //주문번호
				 					null, // 날짜
				 					bookByNo.getB_price()*3, // 책가격
				 					"jihun", // 유저 이름
				 					orderDetailList); //주문상세 배열객체
		 int rowCount = orderDao.create(order);
		 System.out.println(rowCount); //이거 해도 의미없음 어짜피 0 반환 주문 들어가요.
		 
		 //cart에서 cart주문 여러개 전체주문하기. 세션으로 로그인 되어있는회원jihun이 주문
		 List<Cart> cartList = cartDao.cartList("jihun"); // jihun 회원이 카트에 담은 모든것
		 
		 int order_price = 0;
		 for(Cart cart : cartList) {
			 orderDetailList.add(new OrderDetail(0, cart.getC_qty(), 0, cart.getBook()));
			 order_price += cart.getC_qty()*cart.getBook().getB_price();
		 }
		 
		 order = new Orders(0, null, order_price, "jihun", orderDetailList);
		 int rowCount1 = orderDao.create(order);
		 System.out.println(rowCount1);
		 // cartDao.cartDeleteAll("jihun"); 이건 카트에 담은거 주문 했으면 카트 비우는거임.
		 */
		 //o_no로 주문(개별) 삭제
		//System.out.println(orderDao.deleteByOrdersNo(3));
		 //u_id로 주문 전체 삭제
		 
		//System.out.println(orderDao.delete("jihun"));
		
		 
		 //List<Orders> orderList1 = orderDao.List_detail("jihun");
		// System.out.println(orderList1);
		 
		 System.out.println(orderDao.orderDetail("jihun", 3));
		 System.out.println(orderDao.List_detail("jihun"));
		 
	}

}
