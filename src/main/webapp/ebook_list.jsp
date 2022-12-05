<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.Ebook"%>
<%@page import="com.itwill.book.dto.Eorder"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.EbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String u_id = (String)session.getAttribute("sUserId");
EbookService ebookService = new EbookService();
List<Eorder> ebooklist = ebookService.selectById(u_id);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript" src="js/ebook.js"></script>
<style type="text/css" media="screen">
</style>
<title>교보문고</title>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
	</form>
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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td height="22">&nbsp;&nbsp;<b>마이페이지 - eBook보관함</b></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type="button" value="기기등록" onClick="setCookies();"> </td>
									
								</tr>
							</table> 
							<!--form-->
							<!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
							<form name="ebook">
							<table  align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB">
									<tr>
										<td width=60 height=25  align="center" bgcolor="E5F0FA" class=t1><font
											 >선택</font></td>
										<td width=40 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >이미지</font></td>
										<td width=210 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >책이름</font></td>
										<td width=110 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >구매일</font></td>
										<td width=110 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >종료일</font></td>
										
									</tr>
									
									<!-- cart item start -->
									<%
									int tot_price=0;
									for(Eorder ebook : ebooklist){ 
									
									%>
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1><input type="checkbox" name="ebook_check" onchange="check_box_count();" value="<%=ebook.getEbook().getProduct().getB_no()%>" ></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='image/<%=ebook.getEbook().getProduct().getB_image()%>.jpg' width="34" height="28"/></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a href='ebook_detail.jsp?b_no=<%=ebook.getEbook().getProduct().getB_no()%>'><%=ebook.getEbook().getProduct().getB_name() %></a></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1><%=ebook.getEo_date_buy()%></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1><%=ebook.getEo_date_end()%></td>
										
									</tr>
									<%}%>
									<!-- cart item end -->
									
								</table>
								</form>
							</div>
							<!-- 
							</form> 
							 -->
							<br />
							<table style="padding-left: 10px" border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									
									<a href="book_list.jsp" class=m1>계속 구경하기</a>&nbsp;&nbsp;
									
									<a href="javascript:ebook_form_delete_submit();" class=m1>총 <span style="font-weight: bold;" id="ebook_select_count" >0</span>개 삭제하기</a>
									</a>&nbsp;&nbsp;
									
									</td>
								</tr>
							</table></td>
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