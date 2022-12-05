<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
 
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("kyobo_main.jsp");
	return;
}

String c_qtyStr = request.getParameter("c_qty");
String c_noStr= request.getParameter("c_no");

CartService cartService = new CartService();

if(c_qtyStr==null){
	c_qtyStr="";
}

if(c_qtyStr.equals("0")){
	cartService.cartDeleteByCNo(Integer.parseInt(c_noStr));
}else{
	cartService.cartUpdateQty(Integer.parseInt(c_qtyStr), Integer.parseInt(c_noStr));
}


response.sendRedirect("cart_view.jsp");


%>
