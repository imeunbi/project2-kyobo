<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String u_id = (String)session.getAttribute("sUserId");
	


%>
<div id="menu">
	<ul>
	<%if(u_id == null){ %>
	    <li id="logo"><a href="userinfo_view.jsp"></a></li>
		<li><a href="userinfo_insert_form.jsp">회원가입</a></li>
		<li><a href="userinfo_login_form.jsp">로그인</a></li>
		<%}else {%>
	
	    <li id="logo"><a href="userinfo_view.jsp"><%=u_id %></a></li>
		<li><a href="userinfo_logout_action.jsp">로그아웃</a></li>
		<li><a href="cart_view.jsp">장바구니</a></li>
		<li><a href="order_list.jsp">주문목록</a></li>
		<%} %>
	</ul>
</div>
