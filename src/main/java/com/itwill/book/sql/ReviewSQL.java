package com.itwill.book.sql;

public class ReviewSQL {
	
	//새로운 리뷰 작성
	public static final String INSERT_REVIEW_NEW = "insert into review (r_no,r_title,r_contents,r_date,r_grade,u_id,od_no,r_groupno,r_step,r_depth) values(REVIEW_R_NO_SEQ.nextval, ?,?,sysdate,?,?,?, REVIEW_R_NO_SEQ.nextval,1,0)";
	
	//댓글 작성 전 리뷰댓글 STEP 수정
	public static final String UPDATE_REVIEW_REPLY_ORDER_NO = "update review set r_step = r_step+1 where r_step > ? and r_groupno = ?";
	
	//리뷰 댓글 작성
	public static final String INSERT_REVIEW_REPLY = "insert into review(r_no,r_title,r_contents,r_date,u_id,r_groupno,r_step,r_depth) values(REVIEW_R_NO_SEQ.nextval,?,?,sysdate,?,?,?,?)";
	
	//리뷰번호로 리뷰 수정
	public static final String UPDATE_REVIEW = "update review set r_title=?,r_contents=?,r_grade=? where r_no=?";
	
	//리뷰번호로 리뷰삭제
	public static final String DELETE_REVIEW_NO = "delete review where r_no=?";
	
	//리뷰원글을 삭제하면 댓글까지 모두 삭제
	public static final String DELETE_REVIEW_NO_ALL = "delete review where r_groupno=?";
	
	//리뷰 번호로 리뷰조회
	public static final String SELECT_REVIEW_NO = "select * from review where r_no=?";
	
	//책 번호로 리뷰조회
	public static final String SELECT_REVIEW_B_NO = "select * from review r join orderdetail od on r.od_no = od.od_no where od.b_no=?";
	
	//상품페이지에서 해당 상품의 리뷰 전체 조회
	public static final String SELECT_REVIEW_B_NO_PAGE = "select aa.* from(select rownum idx, a.* from (select * from review r join orderdetail od on r.od_no = od.od_no where od.b_no=? order by r_groupno desc, r_step asc) a) aa where aa.idx >=? and aa.idx <=?";
	
	//회원 아이디로 리뷰조회
	public static final String SELECT_REVIEW_U_ID = "select * from review where u_id=?";
	
	//마이페이지에서 아이디로 리뷰리스트 조회 페이지
	public static final String SELECT_REVIEW_U_ID_PAGE = "select ss.* from (select rownum idx, s.* from (select * from review where u_id=? order by r_groupno desc, r_step asc) s )ss where ss.idx >=? and ss.idx <=?";
	
	
	//리뷰리스트 전체 정렬 조회
	public static final String SELECT_REVIEW_ALL = "select r_no,R_NO, R_TITLE, R_DATE, R_GRADE, R_CONTENTS,U_ID, OD_NO, R_GROUPNO, R_STEP, R_DEPTH from review order by r_groupno DESC, r_step ASC";
	
	
	//총 리뷰 수
	public static final String SELECT_REVIEW_COUNT_ALL = "select count(*) from review";
	
	
	//해당 리뷰의 총 댓글 수
	public static final String SELECT_REVIEW_REPLY_COUNT = "select count(*)-1 from review where r_groupno=?";
	
	
	
	
	//---여기부터는 필요가있나
	
	//리뷰 댓글만 전체 삭제
	public static final String DELETE_REVIEW_REPLY_ALL = "delete review where r_groupno=? and r_step >1";
	
	//groupno, step 번호로 댓글 1개 삭제
	public static final String DELETE_REVIEW_REPLY_ONE = "delete review where r_groupno=? and r_step=?";
	
	
	
	
}
