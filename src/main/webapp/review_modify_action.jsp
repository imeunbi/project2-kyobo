<%@page import="com.itwill.book.dao.ReviewDao"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% 
 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}
//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
Review review = new Review();
review.setR_no(Integer.parseInt(request.getParameter("r_no")));
review.setR_title(request.getParameter("r_title"));
review.setR_grade(Integer.parseInt(request.getParameter("r_grade")));
review.setR_contents(request.getParameter("r_contents"));
//2. 데이터베이스에 변경된 내용 적용
ReviewService.getInstance().reviewUpdate(review);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp로 이동
response.sendRedirect(
	String.format("review_view.jsp?r_no=%d&pageno=%s",
	review.getR_no(), pageno));
%>
