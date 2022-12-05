package com.itwill.book.dto;

import java.util.Date;

public class Eorder {
	private int eo_no;
	private Date eo_date_buy;
	private Date eo_date_end;
	private Ebook ebook;
	private String id;
	
	public Eorder() {

	}
	
	public Eorder(int eo_no, Date eo_date_buy, Date eo_date_end, Ebook ebook, String id) {
		super();
		this.eo_no = eo_no;
		this.eo_date_buy = eo_date_buy;
		this.eo_date_end = eo_date_end;
		this.ebook = ebook;
		this.id = id;
	}

	public int getEo_no() {
		return eo_no;
	}

	public void setEo_no(int eo_no) {
		this.eo_no = eo_no;
	}

	public Date getEo_date_buy() {
		return eo_date_buy;
	}

	public void setEo_date_buy(Date eo_date_buy) {
		this.eo_date_buy = eo_date_buy;
	}

	public Date getEo_date_end() {
		return eo_date_end;
	}

	public void setEo_date_end(Date eo_date_end) {
		this.eo_date_end = eo_date_end;
	}

	public Ebook getEbook() {
		return ebook;
	}

	public void setEbook(Ebook ebook) {
		this.ebook = ebook;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Eorder [eo_no=" + eo_no + ", eo_date_buy=" + eo_date_buy + ", eo_date_end=" + eo_date_end + ", ebook="
				+ ebook + ", id=" + id + "]";
	}
	
	
	
	
}
