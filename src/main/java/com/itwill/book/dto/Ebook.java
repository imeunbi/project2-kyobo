package com.itwill.book.dto;


public class Ebook {
	private int e_no;
	private int e_price;
	private Book product;
	
	public Ebook() {

	}

	public Ebook(int e_no, int e_price, Book product) {
		super();
		this.e_no = e_no;
		this.e_price = e_price;
		this.product = product;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public int getE_price() {
		return e_price;
	}

	public void setE_price(int e_price) {
		this.e_price = e_price;
	}

	public Book getProduct() {
		return product;
	}

	public void setProduct(Book product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Ebook [e_no=" + e_no + ", e_price=" + e_price + ", product=" + product + "]";
	}
	
	
	
	
}