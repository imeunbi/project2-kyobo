<%@page import="com.itwill.book.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_list.jsp");
	return;
}

sUserId = (String) session.getAttribute("sUserId");

OrderService orderService = new OrderService();
orderService.delete(sUserId);

response.sendRedirect("order_list.jsp");
%>