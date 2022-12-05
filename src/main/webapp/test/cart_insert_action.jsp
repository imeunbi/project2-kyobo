<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("cart_view.jsp");
	return;
}

	String c_qtyStr = request.getParameter("c_qty");
	String u_id = request.getParameter("u_id");
	String b_noStr = request.getParameter("b_no");
	
	CartService cartService = new CartService();
	Cart cart = new Cart(0, Integer.parseInt(c_qtyStr),u_id, new Book(Integer.parseInt(b_noStr),"","",0,"","","",""));
	cartService.addCart(cart);

    
%>
