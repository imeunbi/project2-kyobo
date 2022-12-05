<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	Review review = new Review();

	review.setR_no(Integer.parseInt(request.getParameter("r_no")));
	
	review.setR_title(request.getParameter("r_title"));
	review.setR_contents(request.getParameter("r_contents"));
	review.setU_id(request.getParameter("u_id"));
	
	ReviewService.getInstance().createReply(review);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("review_view.jsp?r_no=%s",pageno));
	
	*/
	
	String u_id = (String)session.getAttribute("sUserId");
	 
	
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("riview_id_list.jsp");
		return;
	}
	
	String r_reply_no = request.getParameter("r_reply_no");
	String r_title = request.getParameter("r_title");
	String r_contents = request.getParameter("r_contents");
	
	Review insertReplyReview = new Review(Integer.parseInt(r_reply_no),r_title,null,0 ,r_contents,u_id,
			new OrderDetail(0,0,0,new Book(0,null,null,0,null,null,null,null))
			,0,0,0);
	
	ReviewService reviewService = new ReviewService();
	reviewService.createReply(insertReplyReview);
	//response.sendRedirect("review_Id_list.jsp");
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("review_view.jsp?r_no=%s",pageno));
	
%>