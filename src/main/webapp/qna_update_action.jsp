<%@page import="com.itwill.book.dto.Qna"%>
<%@page import="com.itwill.book.service.QnaService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String u_id = (String)session.getAttribute("sUserId");
int pageno=Integer.parseInt(request.getParameter("pageno"));
	//String u_id = "jihun";

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("kyobo_main.jsp"); 
		return;
	}

	
	String q_no = request.getParameter("q_no");
	String q_title = request.getParameter("q_title");
	String q_class = request.getParameter("q_class");
	String q_contents = request.getParameter("q_contents");
	QnaService qnaService = new QnaService();
	
	/*
		private int q_no;
	private String q_clss;
	private String q_title;
	private String q_date;
	private String q_contents;
	private String u_id;
	private int q_groupNo;
	private int q_step;
	private int q_depth;
	*/
	
	Qna qna = new Qna(Integer.parseInt(q_no), q_class, q_title, null, q_contents, u_id, 0,0,0);
	
	
	qnaService.updateByNo(qna);
	response.sendRedirect("qna_view.jsp?q_no="+qna.getQ_no()+"&pageno="+pageno);

	


	
%>
