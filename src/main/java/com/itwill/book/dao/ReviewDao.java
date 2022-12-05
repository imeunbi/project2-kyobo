package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Review;
import com.itwill.book.sql.ReviewSQL;


public class ReviewDao {
	
	private DataSource dataSource;
	
	public ReviewDao() throws Exception{
		  Properties properties=new Properties();
		  properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		  BasicDataSource basicDataSource = new BasicDataSource();
		  basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		  basicDataSource.setUrl(properties.getProperty("url"));
		  basicDataSource.setUsername(properties.getProperty("username"));
		  basicDataSource.setPassword(properties.getProperty("password")); 
		  dataSource = basicDataSource;
		  
	}
	
	//리뷰작성
	public int create(Review review) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.INSERT_REVIEW_NEW);
		//r_no,r_title,r_contents,r_date,r_grade,u_id,od_no,r_groupno,r_step,r_depth
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setInt(3, review.getR_grade());
		pstmt.setString(4, review.getU_id());
		pstmt.setInt(5, review.getOrderDetail().getOd_no());
		int rowCount = pstmt.executeUpdate();

		pstmt.close();
		con.close();
	
		return rowCount;
	}
	
	//댓글작성
	public int createReply(Review review)throws Exception{
		Connection con = dataSource.getConnection();
		
		//댓글의 원글 조회
		Review temp = this.reviewSelectNo(review.getR_no());
		
		//댓글 추가 전 리뷰 정렬
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.UPDATE_REVIEW_REPLY_ORDER_NO);
		pstmt.setInt(1, temp.getR_step());
		pstmt.setInt(2, temp.getR_groupno());
		pstmt.executeUpdate();
		pstmt.close();
		
		//댓글 작성
		pstmt = con.prepareStatement(ReviewSQL.INSERT_REVIEW_REPLY);
			//r_no,r_title,r_contents,r_date,u_id,r_groupno,r_step,r_depth
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setString(3, review.getU_id());
		pstmt.setInt(4, temp.getR_groupno());
		pstmt.setInt(5, temp.getR_step()+1);
		pstmt.setInt(6, temp.getR_depth()+1);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	/*
	R_NO	NUMBER(10,0)
	R_TITLE	VARCHAR2(100 BYTE)
	R_DATE	DATE
	R_GRADE	NUMBER(10,0)
	R_CONTENTS	VARCHAR2(2000 BYTE)
	U_ID	VARCHAR2(50 BYTE)
	OD_NO	NUMBER(10,0)
	R_GROUPNO	NUMBER(10,0)
	R_STEP	NUMBER(10,0)
	R_DEPTH	NUMBER(10,0)
	 */
	
	//리뷰 번호로 리뷰 수정
	public int reviewUpdateByNo(Review review) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.UPDATE_REVIEW);
			//r_title=?,r_contents=?,r_grade=? where r_no=?
		pstmt.setString(1, review.getR_title());
		pstmt.setString(2, review.getR_contents());
		pstmt.setInt(3, review.getR_grade());
		pstmt.setInt(4, review.getR_no());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	//리뷰 수정_정현
	public int update(Review review) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE review " + "SET r_title = ?, r_contents = ? ,r_grade = ?" + "WHERE r_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getR_title());
			pstmt.setString(2, review.getR_contents());
			pstmt.setInt(3, review.getR_grade());
			pstmt.setInt(4, review.getR_no());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	
	//리뷰 번호로 리뷰삭제
	public int reviewDeleteByNo(int r_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.DELETE_REVIEW_NO);
		pstmt.setInt(1, r_no);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	//리뷰 원글을 삭제하면 댓글까지 모두 삭제
	public int reviewDeleteByNoAll (int r_groupno) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.DELETE_REVIEW_NO_ALL);
		pstmt.setInt(1, r_groupno);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	//리뷰번호로 리뷰조회
	public Review reviewSelectNo(int r_no) throws Exception{
		Review findReview = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_NO);
		pstmt.setInt(1, r_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			findReview = new Review(rs.getInt("r_no"),
					rs.getString("r_title"), rs.getDate("r_date"), rs.getInt("r_grade"), 
					rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(0, null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), rs.getInt("r_step"), rs.getInt("r_depth"));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return findReview;
	}
	
	//책 번호로 리뷰조회
	
	public List<Review> reviewSelectByBookNo(Review review) throws Exception{
		List<Review> reviewBookList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_B_NO);
		pstmt.setInt(1, review.getOrderDetail().getBook().getB_no());
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewBookList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewBookList;
	}

/*
	public List<Review> reviewSelectByBookNo(int b_no) throws Exception{
		List<Review> reviewBookList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_B_NO);
		pstmt.setInt(1, b_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewBookList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewBookList;
	}

	
	//************상품페이지에서 해당 상품의 리뷰 전체 조회
	public List<Review> reviewSelectByBookNo(int b_no,int start, int last) throws Exception{
		List<Review> reviewBookList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_B_NO_PAGE);
		pstmt.setInt(1, b_no);
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewBookList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewBookList;
	}
	
*/	

	//************상품페이지에서 해당 상품의 리뷰 전체 조회
	public List<Review> reviewSelectByBookNo(Review review,int start, int last) throws Exception{
		List<Review> reviewBookList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_B_NO_PAGE);
		pstmt.setInt(1, review.getOrderDetail().getBook().getB_no());
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewBookList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(rs.getInt("b_no"), null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewBookList;
	}

	
	//회원 아이디로 리뷰조회
	public List<Review> reviewSelectByUserId(String u_id) throws Exception{
		List<Review> reviewIdList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_U_ID);
		pstmt.setString(1, u_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewIdList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(0, null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewIdList;
	}
	
	//********마이페이지에서 아이디의 리뷰조회
	public List<Review> reviewSelectByUserId(String u_id, int start, int last) throws Exception{
		List<Review> reviewIdList = new ArrayList<Review>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_U_ID_PAGE);
		pstmt.setString(1, u_id);
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			reviewIdList.add(new Review(
					rs.getInt("r_no"), rs.getString("r_title"), rs.getDate("r_date"), 
					rs.getInt("r_grade"), rs.getString("r_contents"), rs.getString("u_id"),
					new OrderDetail(rs.getInt("od_no"), 0, 0, 
							new Book(0, null, null, 0, null, null, null, null)), 
					rs.getInt("r_groupno"), 
					rs.getInt("r_step"), 
					rs.getInt("r_depth")));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewIdList;
	}
	

	
	//총 리뷰 수
	public int reviewCountAll() throws Exception{
		int count = 0;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_COUNT_ALL);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		return count;
	}
	
	//해당 리뷰의 총 댓글 수
	public int reviewReplyCount(int groupno) throws Exception{
		int count = 0;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ReviewSQL.SELECT_REVIEW_REPLY_COUNT);
		pstmt.setInt(1, groupno);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	
	
	
	
		
	
	

	
	
	
	
	
}