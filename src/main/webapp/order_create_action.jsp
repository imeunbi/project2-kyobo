
<%@page import="com.itwill.book.service.CartService"%>
<%@page import="com.itwill.book.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>    
<%
    /*
                    	 주문생성
                    	*/
                    	if(request.getMethod().equalsIgnoreCase("GET")){
                    		response.sendRedirect("order_list.jsp");
                    		return;
                    	}
                    	String buyType=request.getParameter("buyType");
                    	String b_noStr=request.getParameter("b_no");
                    	String b_qtyStr=request.getParameter("b_qty");
                    	String[] cart_item_no_strArray=request.getParameterValues("cart_item_no");
                    	OrderService orderService=new OrderService();
                    	CartService cartService=new CartService();
                    	if(buyType.equals("cart")){
                    		orderService.createCartAll(sUserId);
                    	}else if(buyType.equals("cart_select")){
                    		orderService.createCartSelect(sUserId,cart_item_no_strArray);	
                        }else if(buyType.equals("direct")){
                    		orderService.create(sUserId, Integer.parseInt(b_noStr), Integer.parseInt(b_qtyStr));
                    	}
                    	response.sendRedirect("order_list.jsp");
    %>