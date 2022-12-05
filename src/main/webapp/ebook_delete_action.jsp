<%@page import="com.itwill.book.service.EbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("sUserId");
	String[] b_no = request.getParameterValues("ebook_check");
	Cookie[] cookies = request.getCookies();
	
		
	for(String no : b_no){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals(no)){
			if(cookie.getValue().equals(id)){
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			}
		}
	}
	}
	
	EbookService ebookService = new EbookService();
	
	for(String no : b_no){
	ebookService.remove(Integer.parseInt(no), id);
	}


	response.sendRedirect("ebook_list.jsp");
%>