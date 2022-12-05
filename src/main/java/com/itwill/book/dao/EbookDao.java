package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Book;
import com.itwill.book.dto.Ebook;

public class EbookDao {

	private DataSource dataSource;

	public EbookDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	public Ebook selectByNo(int e_no) throws Exception {
		Ebook ebook = null;
		Book book = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from ebook e join book b on e.b_no = b.b_no where e_no=?");
		pstmt.setInt(1, e_no);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			int e_price = rs.getInt("e_price");
			book=new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"),
					rs.getInt("b_price"), rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
					rs.getString("b_publisher"));
					
			ebook = new Ebook(e_no, e_price, book);
		}

		return ebook;
	}

}