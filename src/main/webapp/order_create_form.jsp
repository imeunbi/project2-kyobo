<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.service.UserInfoService"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<% sUserId = (String) session.getAttribute("sUserId");%>
<% 
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_list.jsp");
	return;
}

String buyType = request.getParameter("buyType");
String b_noStr = request.getParameter("b_no");
String b_qtyStr = request.getParameter("b_qty");
String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");

if(buyType==null)buyType="";
if(b_noStr==null)b_noStr="";
if(b_qtyStr==null)b_qtyStr="";
if(cart_item_noStr_array==null)cart_item_noStr_array=new String[]{};

CartService cartService = new CartService();
UserInfoService userInfoService = new UserInfoService();
BookService bookService = new BookService();

List<Cart> cartItemList = new ArrayList<Cart>();
UserInfo userInfo = userInfoService.selectById(sUserId);

if (buyType.equals("cart")) {
	cartItemList = cartService.getCartList(sUserId);
} else if (buyType.equals("cart_select")) {
	for (String cart_item_noStr : cart_item_noStr_array) {
		cartItemList.add(cartService.cartListOrder(Integer.parseInt(cart_item_noStr)));
		//cartItemList.add(cartService.getCartItemByCartNo(Integer.parseInt(cart_item_noStr)));
	}
} else if (buyType.equals("direct")) {
	Book book = bookService.selectByNo(Integer.parseInt(b_noStr));
	/*	
	private int c_no;
	private int c_qty;
	private String u_id;
	private Book book;
	*/
	cartItemList.add(new Cart(0, Integer.parseInt(b_qtyStr), sUserId, book));
}
/*
private int b_no;
private String b_class;
private String b_name;
private int b_price;
private String b_summary;
private String b_image;
private String b_author;
private String b_publisher;
*/
	//Book book = BookService.selectByNo(new Book(Integer.parseInt(b_noStr));
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>쇼핑몰 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
/*
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	function order_create_form_submit() {
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'order_create_action.jsp';
		document.order_create_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="order_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>"> <input
			type="hidden" name="b_no" value="<%=b_noStr%>"> <input
			type="hidden" name="b_qty" value="<%=b_qtyStr%>">
		<%
		for (String cart_item_noStr : cart_item_noStr_array) {
		%>
		<input type="hidden" name="cart_item_no" value="<%=cart_item_noStr%>">
		<%
		}
		%>
	</form>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											주문/결제폼</b></td>
								</tr>
							</table> <!--form-->
							<form>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">구매자정보</caption>
									<tr>
										<td width=290 height=25 align=center bgcolor="E6ECDE" class=t1>아이디</td>
										<td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>이름</td>
										<td width=166 height=25 align=center bgcolor="E6ECDE" class=t1>이메일</td>
										<td width=50 height=25 align=center bgcolor="E6ECDE" class=t1>비
											고</td>
									</tr>
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_id()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_name()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_email()%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
								</table>

								<br />

								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>책
											이름</td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>수
											량</td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>가
											격</td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>비
											고</td>
									</tr>
									<%
									int tot_price = 0;
									int deli_price = 0;
									for (Cart cart : cartItemList) {
										tot_price += cart.getC_qty() * cart.getBook().getB_price();
										if(1<tot_price && tot_price<=50000){
											deli_price=2500;
										} else {
											deli_price=0;
										}
									%>
									<!-- cart item start -->
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='book_detail.jsp?b_no=<%=cart.getBook().getB_no()%>'><%=cart.getBook().getB_name()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getC_qty()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(cart.getC_qty() * cart.getBook().getB_price())%>
										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- cart item end -->
									<%}%>
										<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> 
												<font color='red'>총 주문 금액 : <span id="tot_order_price"><%=new DecimalFormat("#,##0").format(tot_price)%></span> 원</font><br>
												<font color='red'>(+) 배송비 : <span id="deli_price" name=:"deli_price"><%=new DecimalFormat("#,##0").format(deli_price)%></span> 원</font>
											</p>
										</td>
									</tr>
									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> 
												<font color='red' size=4>총 결제 금액 : <span id="tot_order_price_deli"><%=new DecimalFormat("#,##0").format(tot_price+deli_price)%></span> 원</font>
											</p>
										</td>
									</tr>
								</table>
							</form>
							
							<br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a
										href="javascript:order_create_form_submit();" class=m1>결제하기</a>
										&nbsp;&nbsp;<a href=book_list.jsp class=m1>계속 쇼핑하기</a>

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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>