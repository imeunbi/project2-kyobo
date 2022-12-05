package com.itwill.book.dto;

import java.util.Date;

public class Notice {
	private int n_no;
	private String n_class;
	private String n_title;
	private Date n_date;
	private String n_contents;
	private int n_views;
	private String n_image;
	private int n_groupno;
	private int n_step;
	private int n_depth;
	
	public Notice() {
		
	}
	
	public Notice(int n_no, String n_class, String n_title, Date n_date, String n_contents, int n_views, String n_image,
			int n_groupno, int n_step, int n_depth) {
		super();
		this.n_no = n_no;
		this.n_class = n_class;
		this.n_title = n_title;
		this.n_date = n_date;
		this.n_contents = n_contents;
		this.n_views = n_views;
		this.n_image = n_image;
		this.n_groupno = n_groupno;
		this.n_step = n_step;
		this.n_depth = n_depth;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_class() {
		return n_class;
	}
	public void setN_class(String n_class) {
		this.n_class = n_class;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	public int getN_views() {
		return n_views;
	}
	public void setN_views(int n_views) {
		this.n_views = n_views;
	}
	public String getN_image() {
		return n_image;
	}
	public void setN_image(String n_image) {
		this.n_image = n_image;
	}
	public int getN_groupno() {
		return n_groupno;
	}
	public void setN_groupno(int n_groupno) {
		this.n_groupno = n_groupno;
	}
	public int getN_step() {
		return n_step;
	}
	public void setN_step(int n_step) {
		this.n_step = n_step;
	}
	public int getN_depth() {
		return n_depth;
	}
	public void setN_depth(int n_depth) {
		this.n_depth = n_depth;
	}
	
	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_class=" + n_class + ", n_title=" + n_title + ", n_date=" + n_date
				+ ", n_contents=" + n_contents + ", n_views=" + n_views + ", n_image=" + n_image + ", n_groupno="
				+ n_groupno + ", n_step=" + n_step + ", n_depth=" + n_depth + "]";
	}
	
}
