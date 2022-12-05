<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.dto.PageMakerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String searchType = request.getParameter("searchType");
String keyword = request.getParameter("keyword");
if(searchType==null|| searchType.equals("")){
	response.sendRedirect("book_search_form.jsp");
	return;
}

String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}

PageMakerDto<Book> listPage = null;

 if (searchType.equals("all")) {
		listPage = new BookService().selectByAll(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("name")) {
		listPage = new BookService().selectByName(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("author")) {
		listPage = new BookService().selectByAuthor(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("class")) {
		listPage = new BookService().selectByClass(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("publisher")) {
		listPage = new BookService().selectByPublisher(keyword, Integer.parseInt(pageno));
    }
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
				<div style="margin: 10px;">
					<%
					    if (listPage.itemList.size() == 0) {
					%>
					
					<h1 align="center">검색 결과가 없습니다.</h1>
					<br>
					<div class="book-detail-button">
					&nbsp;&nbsp;<button onclick="location.href='book_search_form.jsp'">돌아가기</button>
					</div>
					<%
					} else {
					%>
						<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>

<tr>
<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>검색어와 일치하는 도서 목록</b></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td height="20" class="t1" align="right" valign="bottom">♠ 총 <font color="#FF0000"><%=listPage.totRecordCount%></font>건 | 현재페이지( <font color="#FF0000"><%=listPage.pageMaker.getCurPage()%></font> / <font color="#0000FF"><%=listPage.pageMaker.getTotPage()%></font> )
								</td>

</tr>
</table>
					<div class="book-detail-button">
					&nbsp;&nbsp;<button onclick="location.href='book_search_form.jsp'">돌아가기</button>
					</div>
					<form name="f" method="post">
					   <table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
<%
int book_size=listPage.itemList.size();
int book_column_size=4;
int book_line_count=1;

for(int i=0;i < listPage.itemList.size();i++){
	Book book=listPage.itemList.get(i);
%>
<%
if(i%book_column_size==0){
%>
<tr>
<%}%> 

<td align="center" width="25%"  bgcolor="ffffff">
<a href="book_detail.jsp?b_no=<%=book.getB_no()%>">

<img width="63px" height="95px" src='image/<%=book.getB_image()%>.jpg' border="0"></a><br> 
										 [<%=book.getB_class()%>]<br> 
											<%=book.getB_name()%><br> 
											저자&nbsp;:&nbsp;<%=book.getB_author()%><br> 
											출판사&nbsp;:&nbsp;<%=book.getB_publisher()%><br> 
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
			     
									<%if(listPage.pageMaker.getPrevGroupStartPage()>0) {%>    
									    <a href="./book_search_result.jsp?pageno=1&searchType=<%=searchType%>&keyword=<%=keyword%>">◀◀</a>&nbsp;
									 <%}%>
									 <%if(listPage.pageMaker.getPrevPage()>0) {%>    
										<a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker.getPrevPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">◀</a>&nbsp;&nbsp;
									 <%}%>
									
									<%
										for (int i = listPage.pageMaker.getBlockBegin(); i <= listPage.pageMaker.getBlockEnd(); i++) {
									 	if (listPage.pageMaker.getCurPage() == i) {
									%>
									 <font color='blue'><strong><%=i%></strong></font>&nbsp;
									<%} else {%>
									<a href="./book_search_result.jsp?pageno=<%=i%>&searchType=<%=searchType%>&keyword=<%=keyword%>"><strong><%=i%></strong></a>&nbsp;
									<%
									   }
									  }%>
									  
									  
									 <%if(listPage.pageMaker.getCurPage() < listPage.pageMaker.getTotPage()){%>
									  <a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker.getNextPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">▶&nbsp;</a>
									 <%}%>
									 <%if(listPage.pageMaker.getNextGroupStartPage()< listPage.pageMaker.getTotPage()){%>
									<a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker.getTotPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">▶▶</a>&nbsp;
									 <%}
									 }%>
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