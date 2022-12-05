<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.UserInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
    
<%

UserInfo userInfo = new UserInfo();
String u_id = (String) session.getAttribute("sUserId");
CartService cartService = new CartService();
List<Cart> cartList = cartService.getCartList(u_id);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>교보문고 - 장바구니</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">

</style>
<script type="text/javascript" src="js/cart.js">
	
</script>
</head>
<body onload="cart_item_select_count();" bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
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
									<td height="22">&nbsp;&nbsp;<Font size="5">장바구니보기</Font></td>
								</tr>
							</table> <!--form--> <!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=50 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><input type="checkbox" id="all_select_checkbox" checked="checked" onchange="cart_item_all_select(event);cart_item_select_count();"></td>
										<td width=60 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><font style><b>이미지</b></font></td>
										<td width=220 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><font><b>책 제목</b></font></td>
										<td width=112 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><font><b>수 량</b></font></td>
										<td width=120 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><font><b>판매가</b></font></td>
										<td width=70 height=25 align="center" bgcolor="#E0E0F8"
											class=t1><font><b>선택삭제</b></font></td>
									</tr>
									<!-- cart item start -->
									
									<%
									int tot_price = 0;
									int deli_price = 0;
									for (Cart cart : cartList) {
										tot_price += cart.getBook().getB_price() * cart.getC_qty();
									%>
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
										 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="<%=cart.getC_no()%>" checked="checked">
										</td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/<%=cart.getBook().getB_image()%>.jpg' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='book_detail.jsp?b_no=<%=cart.getBook().getB_no()%>'><%=cart.getBook().getB_name()%></a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form  method="post"
												id="cart_update_form_<%=cart.getC_no()%>">
												<input type="hidden" name="c_no"
													value="<%=cart.getC_no()%>"> 
													<input type="button" value="-"
													onclick="changeNumber('-','cart_update_form_<%=cart.getC_no()%>');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="c_qty"
													value="<%=cart.getC_qty()%>"> 
													<input type="button" value="+"
													onclick="changeNumber('+','cart_update_form_<%=cart.getC_no()%>');"/>
												<input type="hidden" name="cart_product_unit_price" value="<%=cart.getBook().getB_price()%>"/>	
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,##0").format(cart.getBook().getB_price() * cart.getC_qty())%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											
											<form id="cart_delete_item_form_<%=cart.getC_no()%>">
												<input type="hidden" name="c_no"
													value="<%=cart.getC_no()%>"> <a
													href="javascript:cart_delete_action('cart_delete_item_form_<%=cart.getC_no()%>');">삭제</a>
											</form>

										</td>
									</tr>
									<%}%>
									<!-- cart item end -->
									<%
									if(1<tot_price && tot_price<=50000){
										deli_price=2500;
									} else {
										deli_price=0;
									}
									%>
								

									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> 
												<font color='red'>총 주문 금액 : <span id="tot_order_price"><%=new DecimalFormat("#,##0").format(tot_price)%></span> 원</font><br>
												<font color='red'>(+) 배송비 : <span id="deli_price"><%=new DecimalFormat("#,##0").format(deli_price)%></span> 원</font>
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

							</div> <!-- 
							</form> 
							 --> <br />

							<table style="padding-left: 10px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href="book_list.jsp"
										class=m1>다른 책 보러가기</a>&nbsp;&nbsp; <%
										 if (cartList.size() >= 1) {
										 %> <a href="javascript:cart_view_form_select_submit();" class=m1>
										 	총 <span style="font-weight: bold;" id="cart_item_select_count"></span>개 주문하기
										 	</a>&nbsp;&nbsp;
										 	<a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
											
											<%
											}
											%>
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
		<br><br>
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>