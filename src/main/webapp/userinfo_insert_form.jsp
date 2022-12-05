<%@page import="com.itwill.book.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

  
  UserInfo fuser = (UserInfo)request.getAttribute("fuser");
  String msg = (String)request.getAttribute("msg");
  if(msg==null) msg = "";
  if(fuser == null){
	  fuser = new UserInfo("","","","","","","","");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript" src="js/userinfo.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp"/>
		</div>
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<div id="wrapper">
			<div id="content">
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리
											- 회원 가입</b></td>
								</tr>
							</table> 
							<form name="f">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 13px;" name="u_id" 
											value="<%=fuser.getU_id()%>">&nbsp;&nbsp;<font color="red"><%=msg%></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px; height:15px; font-size: 13px;" name="u_password"
											value="<%=fuser.getU_password()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호 확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px; height:15px; font-size: 13px;" name="password2"
											value="<%=fuser.getU_password()%>" onkeyup="repassword()">&nbsp;&nbsp;<font id="pass2" color="red"></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 13px;" name="u_name"
											value="<%=fuser.getU_name()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">핸드폰번호
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 13px;" name="u_phone" placeholder='ex) 01012345678'
											value="<%=fuser.getU_phone()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">생일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 13px;" name="u_birth"  placeholder='ex) 910101'
											value="<%=fuser.getU_birth()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">성별
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="radio" name="u_gender" value="남"/>남
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="radio" name="u_gender" value="여"/>여
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이메일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 13px;" name="u_email" placeholder='ex) abc@gmail.com'
											value="<%=fuser.getU_email()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">주소
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 15px;" name="u_address"
											value="<%=fuser.getU_address()%>">
										</td>
									</tr>
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1 style="align: center;">
								<tr>
									<td align=center>
									<input type="button" value="회원 가입" onclick="userCreate();"> &nbsp; 
									<input type="button" value="메인" onClick="userMain()">
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="include_common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>
