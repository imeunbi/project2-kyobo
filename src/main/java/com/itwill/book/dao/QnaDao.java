package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Qna;
import com.itwill.book.sql.QnaSQL;
import com.itwill.book.sql.ReviewSQL;



public class QnaDao {
	private DataSource dataSource;
	
	public QnaDao() throws Exception{
		Properties properties=new Properties();
		  properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		  BasicDataSource basicDataSource = new BasicDataSource();
		  basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		  basicDataSource.setUrl(properties.getProperty("url"));
		  basicDataSource.setUsername(properties.getProperty("username"));
		  basicDataSource.setPassword(properties.getProperty("password")); 
		  dataSource = basicDataSource;
	}
	
	
	public int insert(Qna qna)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_INSERT);
		pstmt.setString(1, qna.getQ_clss());
		pstmt.setString(2, qna.getQ_title());
		pstmt.setString(3, qna.getQ_contents());
		pstmt.setString(4, qna.getU_id());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		
		return rowCount;
	}
	public int reinsert(Qna qna) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_REPLY_UPDATE);
		pstmt.setInt(1, qna.getQ_step());
		pstmt.setInt(2, qna.getQ_groupNo());
		pstmt.executeUpdate();
		pstmt.close();
		
		pstmt = con.prepareStatement(QnaSQL.QNA_REPLY_INSERT);
		pstmt.setString(1, qna.getQ_clss());
		pstmt.setString(2, qna.getQ_title());
		pstmt.setString(3, qna.getQ_contents());
		pstmt.setString(4, qna.getU_id());
		pstmt.setInt(5, qna.getQ_groupNo());
		pstmt.setInt(6, qna.getQ_step()+1);
		pstmt.setInt(7, qna.getQ_depth()+1);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		
		
		return rowCount;
	}
	
	
	
	public int update(Qna qna) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_UPDATE);
		pstmt.setString(1, qna.getQ_clss());
		pstmt.setString(2, qna.getQ_title());
		pstmt.setString(3, qna.getQ_contents());
		pstmt.setInt(4, qna.getQ_no());
		pstmt.setString(5, qna.getU_id());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return rowCount;
	}
	
	public int deleteByNoId(int no, String id)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.QNA_DELETE_BY_NO_ID);
		pstmt.setInt(1, no);
		pstmt.setString(2, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public Qna selectByNo(int no)throws Exception {
		Qna qna = null;
		Connection con = dataSource.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append(QnaSQL.QNA_SELECT_BY_NO);
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String q_class = rs.getString("q_class");
			String q_title = rs.getString("q_title");
			String q_date = rs.getString("q_date");
			String q_contents = rs.getString("q_contents");
			String u_id = rs.getString("u_id");
			int q_groupno = rs.getInt("q_groupno");
			int q_step = rs.getInt("q_step");
			int q_depth = rs.getInt("q_depth");
			qna = new Qna(no, q_class, q_title, q_date, q_contents, u_id, q_groupno, q_step, q_depth);
		}
		return qna;
	}
	
	public List<Qna> selectById(String id, int start, int last)throws Exception {
		List<Qna> qnalist = new ArrayList<Qna>();
		Qna qna = null;
		Connection con = dataSource.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append(QnaSQL.QNA_SELECT_BY_ID_START_LAST);
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int q_no = rs.getInt("q_no");
			String q_class = rs.getString("q_class");
			String q_title = rs.getString("q_title");
			String q_date = rs.getString("q_date");
			String q_contents = rs.getString("q_contents");
			String u_id = rs.getString("u_id");
			int q_groupno = rs.getInt("q_groupno");
			int q_step = rs.getInt("q_step");
			int q_depth = rs.getInt("q_depth");
			qna = new Qna(q_no, q_class, q_title, q_date, q_contents, u_id, q_groupno, q_step, q_depth);
			qnalist.add(qna);
		}
		return qnalist;
	}
	
	public List<Qna> selectAll(int start, int last) throws Exception{
		List<Qna> qnalist = new ArrayList<Qna>();
		Connection con = dataSource.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append(QnaSQL.QNA_SELECT_ALL);
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, start);
		pstmt.setInt(2, last);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int q_no = rs.getInt("q_no");
			String q_class = rs.getString("q_class");
			String q_title = rs.getString("q_title");
			String q_date = rs.getString("q_date");
			String q_contents = rs.getString("q_contents");
			String u_id = rs.getString("u_id");
			int q_groupno = rs.getInt("q_groupno");
			int q_step = rs.getInt("q_step");
			int q_depth = rs.getInt("q_depth");
			Qna qna = new Qna(q_no, q_class, q_title, q_date, q_contents, u_id, q_groupno, q_step, q_depth);
			qnalist.add(qna);
		}
		return qnalist;
	}
	
	public int QnaCountAll()throws Exception {
		int count = 0;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QnaSQL.SELECT_QNA_REPLY_COUNT);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		return count;
	}
	
	
	
}