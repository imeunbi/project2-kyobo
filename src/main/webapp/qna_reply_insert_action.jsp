<%@page import="com.itwill.book.service.QnaService"%>
<%@page import="com.itwill.book.dto.Qna"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Qna qna = new Qna();

	qna.setQ_no(Integer.parseInt(request.getParameter("q_no")));
	String title = request.getParameter("q_title");
	title.replace("ㄴ", "");
	title = "ㄴ" + title;
	qna.setQ_title(title);
	qna.setQ_contents(request.getParameter("q_contents"));
	qna.setU_id(request.getParameter("u_id"));
	qna.setQ_groupNo(Integer.parseInt(request.getParameter("q_groupno")));
	qna.setQ_clss(request.getParameter("q_class"));
	qna.setQ_step(Integer.parseInt(request.getParameter("q_step")));
	qna.setQ_depth(Integer.parseInt(request.getParameter("q_depth")));
	
	QnaService.getInstance().createReply(qna);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("qna_view.jsp?pageno=%s",pageno));
	
	
%>