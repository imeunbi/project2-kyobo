package com.itwill.book.dto;

public class Book {
	private int b_no;
	private String b_class;
	private String b_name;
	private int b_price;
	private String b_summary;
	private String b_image;
	private String b_author;
	private String b_publisher;

	@Override
	public String toString() {

		return "Book [b_no=" + b_no + ",b_class=" + b_class + ",b_name=" + b_name + ",b_price=" + b_price
				+ ",b_summary=" + b_summary + ",b_image=" + b_image + ",b_author=" + b_author + ",b_publisher="
				+ b_publisher + "]";
	}

	public Book(int b_no, String b_class, String b_name, int b_price, String b_summary,String b_image, String b_author,String b_publisher) {
		super();
		this.b_no = b_no;
		this.b_class = b_class;
		this.b_name = b_name;
		this.b_price = b_price;
		this.b_summary = b_summary;
		this.b_image = b_image;
		this.b_author = b_author;
		this.b_publisher = b_publisher;

	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public String getB_summary() {
		return b_summary;
	}

	public void setB_summary(String b_summary) {
		this.b_summary = b_summary;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		this.b_author = b_author;
	}

	public String getB_publisher() {
		return b_publisher;
	}

	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}

	public String getB_class() {
		return b_class;
	}

	public void setB_class(String b_class) {
		this.b_class = b_class;
	}

}
