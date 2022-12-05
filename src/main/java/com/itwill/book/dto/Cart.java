package com.itwill.book.dto;


public class Cart {
	
	private int c_no;
	private int c_qty;
	private String u_id;
	private Book book;
	
	public Cart() {
	}
	
	
	public Cart(int c_no, int c_qty, String u_id, Book book) {
		super();
		this.c_no = c_no;
		this.c_qty = c_qty;
		this.u_id = u_id;
		this.book = book;
	}


	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "Cart [c_no=" + c_no + ", c_qty=" + c_qty + ", u_id=" + u_id + ", book=" + book + "]";
	}
	
}
	