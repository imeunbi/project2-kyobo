
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.dto.Orders"%>
<%@page import="com.itwill.book.service.OrderService"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

//String u_id = (String)session.getAttribute("sUserId");

	Integer r_no=null;
	int pageno=1;
	try{
		r_no=Integer.parseInt(request.getParameter("r_no"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(r_no==null){
		//목록으로이동
		response.sendRedirect("review_Id_list.jsp?pageno="+pageno);
		return;
	}
	ReviewService reviewService = new ReviewService();
	Review review=reviewService.reviewSelectNo(r_no);
	if(r_no==null){
		response.sendRedirect("review_Id_list.jsp?pageno="+pageno);
		return;
	}

	/*
	String b_no = request.getParameter("b_no");
	BookService bookService =new BookService();
	Book book=bookService.selectByNo(Integer.parseInt(b_no));
	*/
	
	//String o_no=request.getParameter("j_no");
	//OrderService orderService=new OrderService();
	//Orders orders = orderService.detail(u_id,Integer.parseInt(o_no));
	
%>
<!DOCTYPE html>
<html>
<head>
<title>교보문고</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript" src="js/review.js"></script>
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
								<input type="hidden" name="r_no" value="<%=review.getR_no()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성날짜</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getR_date()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" 
											align="left"><%=review.getOrderDetail().getBook().getB_name()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">별점</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getR_grade()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getR_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" height="100px"
											style="padding-left: 10px" align="left"><%=review.getR_contents()%>

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
								<td align=center>
								<!-- 	<input type="button" value="글쓰기" onClick="reviewCreateGo()"> &nbsp; -->
										<input type="button" value="댓글쓰기" onClick="reviewReplyCreate()"> &nbsp; 
										<input type="button" value="수정" onClick="reviewUpdateGo()"> &nbsp; 
										<input type="button" value="삭제" onClick="reviewRemove()"> &nbsp; 
										<input type="button" value="리스트" onClick="reviewList()"></td>
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
	</div>
	<!--container end-->
</body>
</html>