package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.UserInfo;
import com.itwill.book.sql.UserInfoSQL;


public class UserInfoDao {
	private DataSource dataSource;
	
	public UserInfoDao() throws Exception {
		 Properties properties=new Properties();
		  properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		  BasicDataSource basicDataSource = new BasicDataSource();
		  basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		  basicDataSource.setUrl(properties.getProperty("url"));
		  basicDataSource.setUsername(properties.getProperty("username"));
		  basicDataSource.setPassword(properties.getProperty("password")); 
		  dataSource = basicDataSource; 
	}
	
	
	public int insert (UserInfo user) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_INSERT);
		pstmt.setString(1, user.getU_id());
		pstmt.setString(2, user.getU_password());
		pstmt.setString(3, user.getU_name());
		pstmt.setString(4, user.getU_phone());
		pstmt.setString(5, user.getU_birth());
		pstmt.setString(6, user.getU_gender());
		pstmt.setString(7, user.getU_email());
		pstmt.setString(8, user.getU_address());
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	//update userinfo set u_password=?, u_phone=?, u_email=?, u_address=? where u_id=?
	public int update(UserInfo user) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_UPDATE);
		pstmt.setString(1, user.getU_password());
		pstmt.setString(2, user.getU_phone());
		pstmt.setString(3, user.getU_email());
		pstmt.setString(4, user.getU_address());
		pstmt.setString(5, user.getU_id());
		
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public int deleteById(String id)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_DELETE_BY_ID);
		pstmt.setString(1, id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return rowCount;
	}
	
	public UserInfo selectById(String id) throws Exception{
		UserInfo user = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String u_id = rs.getString("u_id");
			String u_password = rs.getString("u_password");
			String u_name = rs.getString("u_name");
			String u_phone = rs.getString("u_phone");
			String u_birth = rs.getString("u_birth");
			String u_gender = rs.getString("u_gender");
			String u_email = rs.getString("u_email");
			String u_address = rs.getString("u_address");
			
			user = new UserInfo(u_id, u_password, u_name, u_phone, u_birth, u_gender, u_email, u_address);
			
		}
		return user;
	}
	
	public List<UserInfo> selectAll() throws Exception{
		ArrayList<UserInfo> userList = new ArrayList<UserInfo>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_ALL);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String u_id = rs.getString("u_id");
			String u_password = rs.getString("u_password");
			String u_name = rs.getString("u_name");
			String u_phone = rs.getString("u_phone");
			String u_birth = rs.getString("u_birth");
			String u_gender = rs.getString("u_gender");
			String u_email = rs.getString("u_email");
			String u_address = rs.getString("u_address");
			
			userList.add(new UserInfo(u_id, u_password, u_name, u_phone, u_birth, u_gender, u_email, u_address));
			
		}
		return userList;
	}
	
	public String existUserId(String userId)throws Exception {
		String u_id = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			u_id = rs.getString("u_id");
		}
		return u_id;
	}
	
	
	
	
	
}