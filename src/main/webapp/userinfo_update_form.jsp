<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
/*
1. UserService 객체생성
2. 세션의 sUserId를 사용해서 UserService.findUser()메소드 호출
3. 반환된 User객체를 form element value값으로 출력
*/
	UserInfoService userInfoService = new UserInfoService();
	UserInfo user = userInfoService.selectById(sUserId);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내정보 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript" src="js/userinfo.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
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
											- 내정보수정</b></td>
								</tr>
							</table> <!-- update Form  -->
							<form name="f" method="post">

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">사용자
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=sUserId%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="u_password" value="<%=user.getU_password()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="password2" value="<%=user.getU_password()%>" onkeyup="repassword()">&nbsp;&nbsp;<font id="pass2" color="red"></font></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_name" value="<%=user.getU_name()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">핸드폰번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_phone" value="<%=user.getU_phone()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">생일</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150px"
											name="u_birth" value="<%=user.getU_birth()%>"><%=user.getU_birth()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">성별</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150px"
											name="u_gender" value="<%=user.getU_gender()%>"><%=user.getU_gender()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이메일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_email" value="<%=user.getU_email()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">주소
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_address" value="<%=user.getU_address()%>"></td>
									</tr>
								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="내정보수정"
										onClick="userModifyAction()"> &nbsp; <input type="button"
										value="메인" onClick="userMain()"></td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>