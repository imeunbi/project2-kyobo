<%@page import="com.itwill.book.service.UserInfoService"%>
<%@page import="com.itwill.book.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String u_id = (String) request.getParameter("u_id");
String u_password = (String) request.getParameter("u_password");
String u_name = (String) request.getParameter("u_name");
String u_phone = (String) request.getParameter("u_phone");
String u_birth = (String) request.getParameter("u_birth");
String u_gender = (String) request.getParameter("u_gender");
String u_email = (String) request.getParameter("u_email");
String u_address = (String) request.getParameter("u_address");

UserInfo userInfo = new UserInfo(u_id, u_password, u_name, u_phone, u_birth, u_gender, u_email, u_address);
UserInfoService userInfoService = new UserInfoService();
int result = userInfoService.create(userInfo);

if(result==2){
		String msg = u_id + "는 이미 존재하는 아이디 입니다.";
		RequestDispatcher rd = request.getRequestDispatcher("userinfo_insert_form.jsp");
		request.setAttribute("fuser", userInfo);
		request.setAttribute("msg", msg);
		rd.forward(request, response);
		
		
	}else if(result==1){
		/*##################회원가입성공#################*/
		response.sendRedirect("userinfo_login_form.jsp");
		return;
	}
	
%>