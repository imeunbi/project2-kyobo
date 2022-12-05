package com.itwill.book.service;

import java.util.List;

import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.test.cartDaoTest;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;

public class CartService {
	private CartDao cartDao;
	public CartService() throws Exception{
		cartDao = new CartDao();

	}
	
	 
	/*
	 * 카트추가 or 수정
	 */
	
	public int addCart (Cart newCart) throws Exception {
		 	
		int qty = cartDao.cartBookCount(newCart.getU_id(), newCart.getBook().getB_no());
		if(qty == 0) {
			cartDao.cartInsert(newCart);
		} else if (qty ==1) {
			cartDao.cartAddQty(newCart);
		}
		
		return 0;
	}
	
	//카트 수량변경
	public int cartUpdateQty (int c_qty, int c_no) throws Exception{
		
		return cartDao.cartUpdateQty(c_qty,c_no);
	}
	
	 
	/*
	 * 카트리스트보기
	 */
	public List<Cart> getCartList (String u_id) throws Exception{
		return cartDao.cartList(u_id);
	}
	
	
	
	/*
	 * 카트아이템1개삭제
	 */
	public int cartDeleteByCNo (int c_no) throws Exception{
		return cartDao.cartDeleteByNo(c_no);
	}
	
	/*
	 * 카트전체삭제
	 */
	public int cartDeleteAll (String u_id) throws Exception{
		return cartDao.cartDeleteAll(u_id);
	}
	/*
	 * orderInsert 사용
	 */
	public Cart cartListOrder (int c_no)throws Exception{
		return cartDao.cartListOrder(c_no);
	}


}
