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
import com.itwill.book.dto.Cart;
import com.itwill.book.sql.CartSQL;

public class CartDao {
		private DataSource dataSource;
		public CartDao() throws Exception{
			
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
		//수량체크
	public int cartBookCount (String u_id, int b_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.BOOK_COUNT_BY_ID_NO);
		pstmt.setString(1, u_id);
		pstmt.setInt(2, b_no);
		int qty=0;
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			qty = rs.getInt("c_qty");
		}
		if(qty>=1) {
			qty=1;
		}
		con.close();
		return qty ;
	}
		
		
	//cart insert 새로운 상품 추가
	public int cartInsert(Cart newCart) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_INSERT);
		pstmt.setInt(1, newCart.getC_qty());
		pstmt.setString(2, newCart.getU_id() );
		pstmt.setInt(3, newCart.getBook().getB_no());
		
		int insertCount = pstmt.executeUpdate();
		return insertCount;

		
	}
	//cart update_qty 카트수량변경 상품에서
	public int cartAddQty(Cart newCart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_ADD);
		
		pstmt.setInt(1, newCart.getC_qty());
		pstmt.setString(2, newCart.getU_id());
		pstmt.setInt(3, newCart.getBook().getB_no());
		
		int addQtyCount = pstmt.executeUpdate();
		return addQtyCount;
	}
	
	//cart update_qty 카트수량변경 장바구니에서에서
	public int cartUpdateQty(int c_qty, int c_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_UPDATE_QTY);
		
		pstmt.setInt(1, c_qty);
		pstmt.setInt(2, c_no);
		
		int updateQtyCount = pstmt.executeUpdate();
		return updateQtyCount;
	}

	
	//cart deleteByNo 카트 선택삭제
	public int cartDeleteByNo (int c_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_CNO);
		pstmt.setInt(1, c_no);
		
		int deleteNoCount = pstmt.executeUpdate();
		return deleteNoCount;
	}
	
	
	//cart deleteAll 카트 전체삭제
	public int cartDeleteAll (String u_id) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_DELETE_ALL);
		pstmt.setString(1, u_id);
		int deleteAllCount  = pstmt.executeUpdate();
		return deleteAllCount;
	}
	
	
	//cart selectById 카트리스트
	public List<Cart> cartList(String u_id) throws Exception{
		List<Cart> cartList = new ArrayList<Cart>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_ID);
		pstmt.setString(1, u_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Cart cart = new Cart(rs.getInt("c_no"),
								 rs.getInt("c_qty"),
								 rs.getString("u_id"),
								 new Book(rs.getInt("b_no"),
										 rs.getString("b_class"),
										 rs.getString("b_name"),
										  rs.getInt("b_price"),
										  rs.getString("b_summary"),
										  rs.getString("b_image"),
										  rs.getString("b_author"),
										  rs.getString("b_publisher")));
							cartList.add(cart);
		}
		con.close();
		return cartList;
	}
	
	//카트리스트(카트넘버) 주문용
	public Cart cartListOrder(int c_no) throws Exception{
		Cart cartListOrder = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_CNO);
		pstmt.setInt(1, c_no);
		ResultSet rs = pstmt.executeQuery(); 
		while(rs.next()) {
			cartListOrder = new Cart(rs.getInt("c_no"),
								 rs.getInt("c_qty"),
								 rs.getString("u_id"),
								 new Book(rs.getInt("b_no"),
										 rs.getString("b_class"),
										 rs.getString("b_name"),
										  rs.getInt("b_price"),
										  rs.getString("b_summary"),
										  rs.getString("b_image"),
										  rs.getString("b_author"),
										  rs.getString("b_publisher")));
		}
		con.close();
		return cartListOrder;
		
	}
	
	

	
}
