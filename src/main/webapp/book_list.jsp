<%@page import="com.itwill.book.dto.PageMakerDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="login_check.jspf"%>--%>

<%
	//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	
PageMakerDto<Book> bookList = new BookService().getBookList(Integer.parseInt(pageno));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
         <jsp:include page="include_common_left.jsp"/>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>도서 목록</b></td>
								</tr>
							</table>
							</table>
<form name="f" method="post">
<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
<%
int book_size=bookList.itemList.size();
int book_column_size=4;
int book_line_count=1;

for(int i=0;i < bookList.itemList.size();i++){
	Book book=bookList.itemList.get(i);
%>
<%
if(i%book_column_size==0){
%>
<tr>
<%}%> 

<td align="center" width="25%"  bgcolor="ffffff">
<a href="book_detail.jsp?b_no=<%=book.getB_no()%>">
<img width="55px" height="88px" src='image/<%=book.getB_image()%>.jpg' border="0"></a><br>
											 [<%=book.getB_class()%>]<br> 
											 <%=book.getB_name()%><br> 
<font color="#FF0000"><%=new DecimalFormat("#,##0").format(book.getB_price())%>원
</font></td>
<%if(i%book_column_size==3){%>
</tr>
<%}%>
<%}%>
</table>
</form>
<!-- 페이지 번호 리스트 -->
			<table border="0" cellpadding="0" cellspacing="1" width="590">
				<tr>
					<td align="center">
			     
						 <%if(bookList.pageMaker.getPrevGroupStartPage()>0) {%>    
						    <a href="./book_list.jsp?pageno=1">◀◀</a>&nbsp;
						 <%}%>
						 <%if(bookList.pageMaker.getPrevPage()>0) {%>    
							<a href="./book_list.jsp?pageno=<%=bookList.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
						 <%}%>
						
						<%
							for (int i = bookList.pageMaker.getBlockBegin(); i <= bookList.pageMaker.getBlockEnd(); i++) {
						 	if (bookList.pageMaker.getCurPage() == i) {
						%>
						 <font color='blue'><strong><%=i%></strong></font>&nbsp;
						<%} else {%>
						<a href="./book_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
						<%
						   }
						  }%>
						  
						  
						 <%if(bookList.pageMaker.getCurPage() < bookList.pageMaker.getTotPage()){%>
						  <a href="./book_list.jsp?pageno=<%=bookList.pageMaker.getNextPage()%>">▶&nbsp;</a>
						 <%}%>
						 <%if(bookList.pageMaker.getNextGroupStartPage()< bookList.pageMaker.getTotPage()){%>
						<a
						href="./book_list.jsp?pageno=<%=bookList.pageMaker.getTotPage()%>">▶▶</a>&nbsp;
						 <%}%>
					</td>
				</tr>
			</table> 
			<!-- 페이지 번호 리스트 -->
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