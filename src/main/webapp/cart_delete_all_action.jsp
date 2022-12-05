<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("cart_view.jsp");
	return;  
}

String u_id = (String) session.getAttribute("sUserId");

CartService cartService = new CartService();
cartService.cartDeleteAll(u_id);

response.sendRedirect("cart_view.jsp");

%>
