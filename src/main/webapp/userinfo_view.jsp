<%@page import="com.itwill.book.dto.UserInfo"%>
<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String u_id = (String) session.getAttribute("sUserId");
UserInfoService userInfoService = new UserInfoService();
if (u_id == null) {
	response.sendRedirect("userinfo_login_form.jsp");
}

UserInfo user = userInfoService.selectById(u_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">

<script type="text/javascript" src="js/userinfo.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation start-->
		
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내정보 관리
											- 내정보보기</b></td>
								</tr>
							</table> <!-- view Form  -->
							
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">사용자
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_id()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_name()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">생일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_birth()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">핸드폰번호
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_phone()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">이메일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_email()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="40">주소
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getU_address()%>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center><input type="button" value="내정보수정"
										onClick="userModify()">&nbsp; <input type="button"
										value="탈퇴" onClick="userRemove()">&nbsp; <input type="button"
										value="리뷰보기" onClick="reviewGo()">&nbsp; <input type="button"
										value="ebook리스트" onClick="ebookGo()"></td>
								</tr>
							</table>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
</body>
</html>