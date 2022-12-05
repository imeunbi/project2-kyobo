<%@page import="com.itwill.book.dto.QnaPageMakerDto"%>
<%@page import="com.itwill.book.dto.Qna"%>
<%@page import="com.itwill.book.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<%


	String pageNo = request.getParameter("pageno");
	if (pageNo == null || pageNo.equals("")) {
		pageNo = "1";
	}

	
	QnaPageMakerDto qnalistPage = new QnaService().selectAll(Integer.parseInt(pageNo));
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A 게시판</title>
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
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>Q&A게시판
											</b></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠
										총 <font color="#FF0000"><%=qnalistPage.totRecordCount%></font>
										건 | 현재페이지( <font color="#FF0000"><%=qnalistPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=qnalistPage.pageMaker.getTotPage()%></font>
										)
									</td>
							</table> 
					<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">작성자</td>
										<td width=120 align=center bgcolor="E6ECDE">작성날짜</td>
									</tr>
									<%
										for (Qna qna : qnalistPage.itemList) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='qna_view.jsp?q_no=<%=qna.getQ_no()%>&pageno=<%=qnalistPage.pageMaker.getCurPage()%>'>
										<%=qna.getQ_title()%>
										</a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=qna.getU_id()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=qna.getQ_date()%>
										</td>
									</tr>
									
									<%
										}
									%>
								</table>
								</form>
								<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
										 <%if(qnalistPage.pageMaker.getPrevGroupStartPage()>0) {%>    
										    <a href="./qna_list.jsp?pageno=1">◀◀</a>&nbsp;
										 <%}%>
										 <%if(qnalistPage.pageMaker.getPrevPage()>0) {%>    
											<a href="./qna_list.jsp?pageno=<%=qnalistPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										
										<%
											for (int i = qnalistPage.pageMaker.getBlockBegin(); i <= qnalistPage.pageMaker.getBlockEnd(); i++) {
										 	if (qnalistPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./qna_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }%>
										  
										  
										 <%if(qnalistPage.pageMaker.getCurPage()< qnalistPage.pageMaker.getTotPage()){%>
										  <a href="./qna_list.jsp?pageno=<%=qnalistPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
										 <%}%>
										 <%if(qnalistPage.pageMaker.getNextGroupStartPage()< qnalistPage.pageMaker.getTotPage()){%>
										<a
										href="./qna_list.jsp?pageno=<%=qnalistPage.pageMaker.getTotPage()%>">▶▶</a>&nbsp;
										 <%}%>
									</td>
								</tr>
							</table> <!-- button -->
							</td>
					</tr>
				</table>
								
								<table border=0 cellpadding=0 cellspacing=1 style="align: center;">
								<tr>
									<td align=center>
									<input type="button" value="글쓰기" onclick="qnaCreateGo()"> &nbsp; 
									<input type="button" value="메인" onClick="mainGo()">
									
									</td>
								</tr>
							</table>
				
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

