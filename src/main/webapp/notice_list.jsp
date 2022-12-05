<%@page import="com.itwill.book.common.NoticeListPageMakerDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.book.dto.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}

//게시물조회

	NoticeListPageMakerDto noticeListPage 
		= new NoticeService().findNoticeList(Integer.parseInt(pageno));
%>
<!DOCTYPE html>
<html>
<head>
<title>교보문고</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

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

						<br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>게시판-리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠
										총 <font color="#FF0000"><%=noticeListPage.totRecordCount%></font>
										건 | 현재페이지( <font color="#FF0000"><%=noticeListPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=noticeListPage.pageMaker.getTotPage()%></font>
										)
									</td>
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="POST" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">분류</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">본횟수</td>
									</tr>
									<%
										for (Notice notice:noticeListPage.itemList) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='notice_view.jsp?noticeno=<%=notice.getN_no()%>&pageno=<%=noticeListPage.pageMaker.getCurPage()%>'>
										<%=notice.getN_title()%>
										</a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=notice.getN_class()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=notice.getN_date().toString().substring(0, 10)%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=notice.getN_views()%>
										</td>
									</tr>
									<!-- 
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
											href='board_view.jsp?boardno=532&pageno=6'>게시판타이틀514</a></td>
										<td width=120 align=center bgcolor="ffffff">김경호514</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10">2014-12-23
										</td>
										<td width=70 align=center bgcolor="ffffff">0</td>
									</tr>
									 -->
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
										 <%if(noticeListPage.pageMaker.getPrevGroupStartPage()>0) {%>    
										    <a href="./notice_list.jsp?pageno=1">◀◀</a>&nbsp;
										 <%}%>
										 <%if(noticeListPage.pageMaker.getPrevPage()>0) {%>    
											<a href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										<%
											for (int i = noticeListPage.pageMaker.getBlockBegin(); i <= noticeListPage.pageMaker.getBlockEnd(); i++) {
										 	if (noticeListPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./notice_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }
										 %>
										 <%if(noticeListPage.pageMaker.getCurPage() != noticeListPage.pageMaker.getTotPage()){%>
										  <a href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
										 <%}%>
										 <%if(noticeListPage.pageMaker.getNextGroupStartPage() < noticeListPage.pageMaker.getTotPage()){%>
										<a
										href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getNextGroupStartPage()%>">▶▶</a>&nbsp;
										 <%}%>
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