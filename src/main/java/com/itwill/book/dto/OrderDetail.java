package com.itwill.book.dto;


public class OrderDetail {
	private int od_no;
	private int od_qty;
	private int o_no;
	private Book book;
	
	public OrderDetail() {

	}
	
	public OrderDetail(int od_no, int od_qty, int o_no, Book book) {
		super();
		this.od_no = od_no;
		this.od_qty = od_qty;
		this.o_no = o_no;
		this.book = book;
	}
	
	public int getOd_no() {
		return od_no;
	}

	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}

	public int getOd_qty() {
		return od_qty;
	}

	public void setOd_qty(int od_qty) {
		this.od_qty = od_qty;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "OrderDetail [od_no=" + od_no + ", od_qty=" + od_qty + ", o_no=" + o_no + ", book=" + book + "]";
	}
	
}
