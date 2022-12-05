package com.itwill.book.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;

public class OrderService {
	private OrderDao orderDao;
	private BookDao bookDao;
	private CartDao cartDao;
	
	public OrderService() throws Exception{
	orderDao = new OrderDao();
	bookDao = new BookDao();
	cartDao = new CartDao();
}
	//상품에서 주문
	public int create(String sUserId, int b_no, int od_qty) throws Exception {
		Book book = bookDao.selectByNo(b_no);
		OrderDetail orderDetail = new OrderDetail(0, od_qty, b_no, book);
		ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		orderDetailList.add(orderDetail);
		Orders creatOrder =
				new Orders(b_no,
							null,
							orderDetailList.get(0).getOd_qty()*orderDetailList.get(0).getBook().getB_price(),
							sUserId,
							orderDetailList);
		
		
		return orderDao.create(creatOrder);
	}
		//카트 전체 주문
		public int createCartAll(String sUserId) throws Exception {
			List<Cart> cartList = cartDao.cartList(sUserId);
			ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
			int o_tot_price = 0;
			int od_tot_count = 0;
			for (Cart cart : cartList) {
				OrderDetail orderDetail = new OrderDetail(0, cart.getC_qty(), 0, cart.getBook());
				orderDetailList.add(orderDetail);
				o_tot_price+=orderDetail.getOd_qty()*orderDetail.getBook().getB_price();
				od_tot_count+=orderDetail.getOd_qty();
			
			}
				Orders creatOrder = new Orders(0, null, o_tot_price, sUserId, orderDetailList);
				orderDao.create(creatOrder);
				cartDao.cartDeleteAll(sUserId);
				return 0;				
			
		}
		//카트 선택 주문
		
		public int createCartSelect(String sUserId, String[] cart_item_noStr_array) throws Exception {
			ArrayList<OrderDetail> orderItemList=new ArrayList<OrderDetail>();
			int o_tot_price=0;
			int oi_tot_count=0;
			for(int i =0;i<cart_item_noStr_array.length;i++) {
				Cart cart = cartDao.cartListOrder(Integer.parseInt(cart_item_noStr_array[i]));
				OrderDetail orderDetail=new OrderDetail(0, cart.getC_qty(),0,cart.getBook());
				orderItemList.add(orderDetail);
				o_tot_price+=orderDetail.getOd_qty()*orderDetail.getBook().getB_price();
				oi_tot_count+=orderDetail.getOd_qty();
			}
			Orders newOrder=new Orders(0, null, o_tot_price, sUserId,orderItemList);
			orderDao.create(newOrder);
			for(int i =0;i<cart_item_noStr_array.length;i++) {
				cartDao.cartDeleteByNo(Integer.parseInt(cart_item_noStr_array[i]));
			}
		return 0;
		
		}
		//주문 1개 삭제
		public int DeleteByOrderNo(int o_no) throws Exception {
			return orderDao.deleteByOrdersNo(o_no);
		}
		//주문 전체 삭제
		public int delete(String sUserId) throws Exception{
			return orderDao.delete(sUserId); 
		}
		//주문목록
		public List<Orders> list(String sUserId) throws Exception {
			return orderDao.List_detail(sUserId);
		}
		//주문 상세보기
		public Orders detail(String sUserId, int o_no) throws Exception {
			return orderDao.orderDetail(sUserId, o_no);
		}
		
		
}
