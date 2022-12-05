package com.itwill.book.sql;

public class EbookSQL {
	public static final String INSERT = "insert into eorder values(eorder_eo_no_seq.nextval, sysdate, sysdate+90,?, ?)";
	public static final String UPDATE = "update eorder set eo_date_end = eo_date_end+90 where e_no=? and u_id =?";
	public static final String DELETE = "delete eorder where e_no=? and u_id=?";
	public static final String SELECT_BY_ID = "select * from eorder eo join ebook e on eo.e_no = e.e_no join book b on e.b_no = b.b_no where eo.u_id = ?";
	public static final String SELECT_BY_ID_E_NO = "select * from eorder eo join ebook e on eo.e_no = e.e_no join book b on e.b_no = b.b_no where eo.u_id=? and eo.e_no=?";
}
