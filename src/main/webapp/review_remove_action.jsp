<%@page import="java.io.PrintWriter"%>
<%@page import="com.itwill.book.dao.ReviewDao"%>
<%@page import="com.itwill.book.common.ReviewException"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    String u_id=null;
    if(session.getAttribute("sUserId")!=null){
    	u_id=(String)session.getAttribute("sUserId");
    }
    
	Integer r_no = null;
	Integer pageno = null;
	try {
		r_no = Integer.valueOf(request.getParameter("r_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	Review review = new ReviewDao().reviewSelectNo(r_no);
	if(!u_id.equals(review.getU_id())){
		result = false;
		msg = "권한이 없습니다";
	} else {
		 try{
			ReviewService.getInstance().reviewDeleteByNo(r_no);
			result = true;
			msg = "삭제 성공";
	} catch(ReviewException e){
		result = false;
		msg = "권한이 없습니다:" + e.getMessage();
	}
	}
	
%>

<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='review_Id_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='review_Id_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>
 