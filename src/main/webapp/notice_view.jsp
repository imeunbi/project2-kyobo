<%@page import="com.itwill.book.dto.Notice"%>
<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Integer noticeno=null;
	int pageno=1;
	try{
		noticeno =Integer.parseInt(request.getParameter("noticeno"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		e.printStackTrace();
	}
	if(noticeno==null){
		//목록으로이동
		response.sendRedirect("notice_list.jsp?pageno="+pageno);
		return;
	}
	Notice notice=NoticeService.getInstance().noticeSelectByNo(noticeno);
	if(notice==null){
		response.sendRedirect("notice_list.jsp?pageno="+pageno);
		return;
	}
	
	//읽은회수증가
	NoticeService.getInstance().updateviewCount(noticeno);

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
<script type="text/javascript">
function noticeList() {
	f.action = "notice_list.jsp";
	f.submit();
}
console.log("N_no : <%=notice.getN_no() %>");
console.log("N_date : <%=notice.getN_date()%>");
console.log("N_content :<%=notice.getN_contents().replace("\n","<br/>")%>");
console.log("N_title : <%=notice.getN_title()%>");
console.log("N_title :<%=notice.getN_title()%>");
console.log("N_image :<%=notice.getN_image()%>");
</script>
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
						<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>
											게시글상세 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->

							<form name="f" method="post">
								<input type="hidden" name="notino" value="<%=notice.getN_no() %>">
								<!-- <input type="hidden" name="notino" value="26"> -->
								<input type="hidden" name="pageno" value="1">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지일</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=notice.getN_date()%></td>
										<!-- <td width=490 bgcolor="ffffff" align="left" style="padding-left: 10">20220806</td> -->
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=notice.getN_title()%></td>
										<!-- <td width=490 bgcolor="ffffff" align="left" style="padding-left: 10">테스트</td> -->
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=notice.getN_contents().replace("\n","<br/>")%></td>
										<!-- <td width=490 bgcolor="ffffff" align="left" style="padding-left: 10">test</td> -->
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이미지</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10">
										<img border=0 src="image/<%=notice.getN_image()%>" style =  "width:100%; height : auto;"></td>
										<!-- <img border=0 src="image/1_courage.jpg" style =  "width:100%; height : auto;"></td> -->
									</tr>
								</table>
							</form><br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<input type="button" value="리스트" onClick="noticeList()"></td>
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