<%@page import="com.itwill.book.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>       
<%
       /*
                     1.주문번호받기
                     2.주문삭제
                       	- 주문상세테이블 delete
                       	- 주문테이블 delete
                     */
                     	if(request.getMethod().equalsIgnoreCase("GET")){
                     		response.sendRedirect("order_list.jsp");
                     		return;
                     	}
                     	String j_noStr=request.getParameter("j_no");
                     	OrderService orderService=new OrderService();
                     	orderService.DeleteByOrderNo(Integer.parseInt(j_noStr));
                     	response.sendRedirect("order_list.jsp");
       %>