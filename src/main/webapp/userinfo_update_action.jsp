<%@page import="com.itwill.book.service.UserInfoService"%>
<%@page import="com.itwill.book.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String u_id = (String) session.getAttribute("sUserId");
String u_password = (String) request.getParameter("u_password");
String u_name = (String) request.getParameter("u_name");
String u_phone = (String) request.getParameter("u_phone");
String u_birth = (String) request.getParameter("u_birth");
String u_gender = (String) request.getParameter("u_gender");
String u_email = (String) request.getParameter("u_email");
String u_address = (String) request.getParameter("u_address");

UserInfo userInfo = new UserInfo(u_id, u_password, u_name, u_phone, u_birth, u_gender, u_email, u_address);
UserInfoService userInfoService = new UserInfoService();
int result = userInfoService.update(userInfo);

response.sendRedirect("userinfo_view.jsp");








%>