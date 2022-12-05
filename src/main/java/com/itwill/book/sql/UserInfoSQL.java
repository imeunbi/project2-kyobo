package com.itwill.book.sql;

public class UserInfoSQL {
	public static final String USER_INSERT = "insert into userinfo values(?,?,?,?,?,?,?,?)";
	public static final String USER_UPDATE = "update userinfo set u_password=?, u_phone=?, u_email=?, u_address=? where u_id=?";
	public static final String USER_DELETE_BY_ID = "delete from userinfo where u_id=?";
	public static final String USER_SELECT_ALL = "select * from userinfo";
	public static final String USER_SELECT_BY_ID = "select * from userinfo where u_id=?";
}