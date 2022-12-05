<%@page import="com.itwill.book.dto.Qna"%>
<%@page import="com.itwill.book.service.QnaService"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int q_no= 0;
	int pageno=1;
	try{
		q_no=Integer.parseInt(request.getParameter("q_no"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(q_no==0){
		//목록으로이동
		response.sendRedirect("qna_list.jsp?pageno="+pageno);
		return;
	}
	QnaService qnaService = new QnaService();
	Qna qna=qnaService.selectByNo(q_no);
	if(q_no==0){
		response.sendRedirect("qna_list.jsp?pageno="+pageno);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>교보문고</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript" src="js/qna.js"></script>
<style type="text/css" media="screen">
</style>
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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 게시물
											내용보기 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->
							
							<form name="f" method="post">
								<input type="hidden" name="q_no" value="<%=qna.getQ_no()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=qna.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=qna.getQ_clss()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성날짜</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=qna.getQ_date()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=qna.getQ_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" height="100px"
											style="padding-left: 10px" align="left"><%=qna.getQ_contents().replace("\n", "<br/>")%>

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="답글쓰기"
										onClick="qnaReplyCreateGo()"> &nbsp; 
										<input type="button" value="수정" onClick="qnaUpdateGo()"> &nbsp; 
										<input type="button" value="삭제" onClick="qnaRemove()"> &nbsp; 
										<input type="button" value="리스트" onClick="qnaList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
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