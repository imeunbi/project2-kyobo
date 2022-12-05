<%@page import="com.itwill.book.dto.Qna"%>
<%@page import="com.itwill.book.service.QnaService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.UserInfo"%>
<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String u_id="enbi";

String sUserId = (String)session.getAttribute("sUserId");
int pageno=Integer.parseInt(request.getParameter("pageno"));
if(sUserId == null){
	response.sendRedirect("kyobo_main.jsp");
}

String q_no = request.getParameter("q_no");
QnaService qnaService = new QnaService();
Qna qna = qnaService.selectByNo(Integer.parseInt(q_no));

%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새로운 리뷰 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript" src="js/qna.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp"/>
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
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>새로운 리뷰 작성
											</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f" method="post">
								<input type="hidden" name="q_no" value="<%=qna.getQ_no()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="q_title" value="<%=qna.getQ_title()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="q_class" value="<%=qna.getQ_clss()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_id" readonly="readonly" disabled=true value=<%=sUserId %>></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">리뷰내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="q_contents" class="textarea"
												style="width: 350px" rows="10" ><%=qna.getQ_contents() %></textarea></td>
									</tr>
								</table>
							</form> <br>

							<table border=0 cellpadding=0 cellspacing=1 style="align: center;">
								<tr>
									<td align=center>
									<input type="button" value="작성" onclick="qnaUpdate()"> &nbsp; 
									<input type="button" value="메인" onClick="mainGo()">
									
									</td>
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
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>