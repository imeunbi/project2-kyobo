<%@page import="com.itwill.book.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String u_id = (String)session.getAttribute("sUserId");
	String q_no = request.getParameter("q_no");
	QnaService qnaService = new QnaService();
	int rowCount = qnaService.deleteByNo(Integer.parseInt(q_no), u_id);

	if(rowCount == 0){
		String msg = "해당게시물은 삭제 권한이 없습니다.";
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='qna_list.jsp';");
		out.println("</script>");
		
	}
	
	if(rowCount == 1){
		String msg = "삭제가 완료되었습니다.";
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='qna_list.jsp';");
		out.println("</script>");
		
		
		
	}


%>