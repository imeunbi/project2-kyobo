<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String u_id = (String)session.getAttribute("sUserId");

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_id_list.jsp"); //일단 여기로 하고 나중에 수정하기
		return;
	}
	

	
	
	String r_title = request.getParameter("r_title");
	String r_contents = request.getParameter("r_contents");
	String r_grade = request.getParameter("r_grade");
	//String u_id = request.getParameter("u_id");
	String od_no = request.getParameter("od_no");
	ReviewService reviewService = new ReviewService();
	
	
	Review insertreview = new Review(0,r_title,null,Integer.parseInt(r_grade) ,r_contents,u_id,
			new OrderDetail(Integer.parseInt(od_no),0,0,new Book(0,null,null,0,null,null,null,null))
			,0,0,0);
	
	
	reviewService.create(insertreview);
	response.sendRedirect("review_Id_list.jsp");

	


	
%>
