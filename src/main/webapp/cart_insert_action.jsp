<%@page import="java.awt.PrintGraphics"%>
<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("kyobo_main");
		return;
	}
	
	String u_id = (String) session.getAttribute("sUserId");
	
	String c_qtyStr = request.getParameter("cart_qty");
	String b_noStr = request.getParameter("b_no");
	
	Cart cart = new Cart(0,Integer.parseInt(c_qtyStr),u_id,new Book(Integer.parseInt(b_noStr),"","",0,"","","",""));
	CartService cartService = new CartService();
	cartService.addCart(cart);
	
	response.sendRedirect("cart_view.jsp");

%>