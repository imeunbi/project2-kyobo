<%@page import="com.itwill.book.service.EbookService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] b_no = request.getParameterValues("b_no");
	String id = (String)session.getAttribute("sUserId");
	
	if(id==null){
		response.sendRedirect("userinfo_login_from.jsp");
		return;
	}
	
	Cookie[] cookie = request.getCookies();
	
	for(int i=0; i<b_no.length; i++){
			
		EbookService ebookService = new EbookService();
		long time = ebookService.remaintime(id, Integer.parseInt(b_no[i]));
		int a = (int)(time/1000);
		
		Cookie c = new Cookie(b_no[i],id);
		c.setPath("/");
		//int time=60*60*24*90;
		c.setMaxAge(a);
		response.addCookie(c);
		
	}
	
	
	response.sendRedirect("ebook_list.jsp");
	/* RequestDispatcher rd = request.getRequestDispatcher("ebook_detail.jsp");
	rd.forward(request, response); */



%>