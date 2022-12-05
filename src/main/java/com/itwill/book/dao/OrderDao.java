package com.itwill.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;
import com.itwill.book.sql.OrderSQL;

public class OrderDao {
	
	private DataSource dataSource;
	
	public OrderDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	// 주문 insert
	public int create(Orders orders)throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false); 
			//Orders
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_INSERT);
			pstmt1.setInt(1, orders.getO_price());
			pstmt1.setString(2, orders.getU_id());
			pstmt1.executeUpdate();
			//orderDetail
			pstmt2 = con.prepareStatement(OrderSQL.ORDER_DETAIL_INSERT);
			for (OrderDetail orderDetail : orders.getOrderDetailList()) {			
				pstmt2.clearParameters();
				pstmt2.setInt(1, orderDetail.getOd_qty());
				pstmt2.setInt(2, orderDetail.getBook().getB_no());
				pstmt2.executeUpdate();
			}	
			con.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return 0;
	}
	
	//회원 아이디로 주문 전체 삭제. delete
	public int delete(String sUserId)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(OrderSQL.ORDER_DELETE_ALL_BY_U_ID);
			pstmt.setString(1, sUserId);
			rowCount = pstmt.executeUpdate();
			con.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			
			con.rollback();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return rowCount;
	}
	
	// o_no로 주문 1건 삭제 on delete cascade
	public int deleteByOrdersNo(int o_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false); //내가 직접 커밋 롤백 하겠다.
			pstmt = con.prepareStatement(OrderSQL.ORDER_DELETE_BY_O_NO);
			pstmt.setInt(1, o_no);
			rowCount = pstmt.executeUpdate();
			con.commit(); // 커밋
		}catch (Exception e) {
			con.rollback(); // 오류뜨면 롤백
			e.printStackTrace(); // 오류 정보 알려줌.
			throw e; 
		}finally {
			if(con!=null)con.close(); // 오류가 뜨던 말건 실행하는건데 다 썼으면 연결 닫는거임.
		}
	
		return rowCount;
	}
	//회원 주문내역 전체 출력 clear
		public List<Orders> List_detail(String sUserId) throws Exception {
			List<Orders> orderList = new ArrayList<Orders>();
			
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt1 = con.prepareStatement(OrderSQL.ORDER_SELECT_ALL_BY_U_ID);
			PreparedStatement pstmt2 = con.prepareStatement(OrderSQL.ORDER_SELECT_BY_U_NO);
			
			pstmt1.setString(1, sUserId);
			ResultSet rs1 = pstmt1.executeQuery();
			while(rs1.next()) {
				int temp_o_no = rs1.getInt("o_no");
				
				pstmt2.setString(1, sUserId);
				pstmt2.setInt(2, temp_o_no);
				ResultSet rs2 = pstmt2.executeQuery();
				Orders orders = null;
				if(rs2.next()) {
					orders = new Orders(rs2.getInt("o_no"),
										rs2.getDate("o_date"),
										rs2.getInt("o_price"),
										rs2.getString("u_id"),
										null);
					
					List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
					do {
						orderDetailList.add(new OrderDetail(rs2.getInt("od_no"),
															rs2.getInt("od_qty"), 
															rs2.getInt("o_no"),
															new Book(rs2.getInt("b_no"),
															rs2.getString("b_class"), 
															rs2.getString("b_name"), 
															rs2.getInt("b_price"), 
															rs2.getString("b_summary"), 
															rs2.getString("b_image"), 
															rs2.getString("b_author"), 
															rs2.getString("b_publisher"))));	
					}while(rs2.next());
					orders.setOrderDetailList(orderDetailList);
				}
				orderList.add(orders);
			}
			return orderList;
		}
	
	// orders select all 회원의 주문 리스트
	/*
	public ArrayList<Orders> ordersList(String sUserId) throws Exception{
		ArrayList<Orders> ordersList = new ArrayList<Orders>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_ALL_BY_USERID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			ordersList.add(new Orders(rs.getInt("o_no"),
									  rs.getDate("o_date"),
									  rs.getInt("o_price"),
									  rs.getString("u_id"),
									  null));
			}
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return ordersList;
	}
	*/
	// orderdetail select 주문 1개 상세보기 clear
	public Orders orderDetail(String sUserId, int o_no) throws Exception{
		Orders order = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDetail> orderDetail = new ArrayList<OrderDetail>(); 
		
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_BY_U_NO);
		pstmt.setString(1, sUserId);
		pstmt.setInt(2, o_no);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			order = new Orders(rs.getInt("o_no"),
							   rs.getDate("o_date"),
							   rs.getInt("o_price"),
							   rs.getString("u_id"),
							   orderDetail);
			do {
				order.getOrderDetailList().add(new OrderDetail(rs.getInt("od_no"),
															   rs.getInt("od_qty"),
															   rs.getInt("o_no"),
															   new Book(rs.getInt("b_no"),
																	    rs.getString("b_class"),
																	    rs.getString("b_name"),
																	    rs.getInt("b_price"),
																	    rs.getString("b_summary"),
																	    rs.getString("b_image"),
																	    rs.getString("b_author"),
																	    rs.getString("b_publisher"))));
			}while(rs.next());
		}
		con.close();
		return order;
	}
}	
