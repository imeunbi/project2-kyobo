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
import com.itwill.book.dto.Ebook;
import com.itwill.book.dto.Eorder;
import com.itwill.book.sql.EbookSQL;


public class EorderDao {
	private DataSource dataSource;

	public EorderDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	public int insert(int e_no, String id) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.INSERT);
		pstmt.setInt(1, e_no);
		pstmt.setString(2, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		
		return rowCount;
	}
	
	public int update(int e_no, String id) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.UPDATE);
		pstmt.setInt(1, e_no);
		pstmt.setString(2, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public int delete(int e_no, String id) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.DELETE);
		pstmt.setInt(1, e_no);
		pstmt.setString(2, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public List<Eorder> selectById(String id) throws Exception{
		Ebook ebook = null;
		Book book = null;
		List<Eorder> eorderList = new ArrayList<Eorder>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.SELECT_BY_ID);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int eo_no = rs.getInt("eo_no");
			Date date_buy = rs.getDate("eo_date_buy");
			Date date_end = rs.getDate("eo_date_end");
			String u_id = rs.getString("u_id");
			
			book=new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher"));
			
			
			ebook = new Ebook(rs.getInt("e_no"), rs.getInt("eo_no"), book);
			
			
			eorderList.add(new Eorder(eo_no, date_buy, date_end, ebook, u_id));
		}
		return eorderList;
	}
	
	
	
	public Eorder selectByIdNo(String id, int e_no) throws Exception{
		Ebook ebook = null;
		Book book = null;
		Eorder eorder = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.SELECT_BY_ID_E_NO);
		pstmt.setString(1, id);
		pstmt.setInt(2, e_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			int eo_no = rs.getInt("eo_no");
			Date date_buy = rs.getDate("eo_date_buy");
			Date date_end = rs.getDate("eo_date_end");
			String u_id = rs.getString("u_id");
			
			book=new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher"));
			
			
			ebook = new Ebook(rs.getInt("e_no"), rs.getInt("eo_no"), book);
			
			
			eorder = new Eorder(eo_no, date_buy, date_end, ebook, u_id);
		}
		return eorder;
	}
	
	
	public long remaintime(String id, int e_no)throws Exception {
		Eorder eorder = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(EbookSQL.SELECT_BY_ID_E_NO);
		pstmt.setString(1, id);
		pstmt.setInt(2, e_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			int eo_no = rs.getInt("eo_no");
			Date date_buy = rs.getDate("eo_date_buy");
			Date date_end = rs.getDate("eo_date_end");
			String u_id = rs.getString("u_id");
			eorder = new Eorder(eo_no, date_buy, date_end, null, u_id);
		}
		Date date = new Date();
		long remaintime = eorder.getEo_date_end().getTime() - date.getTime();
		
		return remaintime;
	}
	
	
	
}
