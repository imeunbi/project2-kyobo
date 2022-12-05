package com.itwill.book.service.test;

import java.util.List;

import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;
import com.itwill.book.service.CartService;

public class cartServiceTestMain {

	public static void main(String[] args) throws Exception{
		CartService cartService = new CartService();
		
		int qty = cartService.addCart(new Cart(0,0,"jihun",
							new Book(3, null, null, 0, null, null, null, null)));
		
		System.out.println(qty);
		
//		int deleteNoCount = cartService.cartDeleteByCNo(1);
//		System.out.println(deleteNoCount);
//		
//		int deleteAll = cartService.cartDeleteAll("hunjeong");
//		System.out.println(deleteAll);
//		
//		
//		List<Cart> cartList = cartService.getCartList("jihun");
//		System.out.println(cartList);
//		
//		int cartUpdateQty = cartService.cartUpdateQty(9,3);
//		System.out.println(cartUpdateQty);
//		

	}

}
