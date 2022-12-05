DROP TABLE eorder CASCADE CONSTRAINTS;
DROP TABLE ebook CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE orderdetail CASCADE CONSTRAINTS;
DROP TABLE book CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		u_id                          		VARCHAR2(50)		 NULL ,
		u_password                    		VARCHAR2(50)		 NULL ,
		u_name                        		VARCHAR2(20)		 NULL ,
		u_phone                       		VARCHAR2(50)		 NULL ,
		u_birth                       		VARCHAR2(50)		 NULL ,
		u_gender                      		CHAR(10)		 NULL ,
		u_email                       		VARCHAR2(50)		 NULL ,
		u_address                     		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE userinfo_u_id_SEQ;

CREATE SEQUENCE userinfo_u_id_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE notice(
		n_no                          		NUMBER(10)		 NULL ,
		n_class                       		VARCHAR2(50)		 NULL ,
		n_title                       		VARCHAR2(100)		 NULL ,
		n_date                        		DATE		 DEFAULT sysdate		 NULL ,
		n_contents                    		VARCHAR2(2000)		 NULL ,
		n_views                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE notice_n_no_SEQ;

CREATE SEQUENCE notice_n_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE QNA(
		q_no                          		NUMBER(10)		 NULL ,
		q_class                       		VARCHAR2(50)		 NULL ,
		q_title                       		VARCHAR2(100)		 NULL ,
		q_date                        		DATE		 DEFAULT sysdate		 NULL ,
		q_contents                    		VARCHAR2(2000)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE QNA_q_no_SEQ;

CREATE SEQUENCE QNA_q_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE book(
		b_no                          		NUMBER(10)		 NULL ,
		b_class                       		VARCHAR2(50)		 NULL ,
		b_name                        		VARCHAR2(100)		 NULL ,
		b_price                       		NUMBER(10)		 NULL ,
		b_summary                     		VARCHAR2(512)		 NULL ,
		b_image                       		VARCHAR2(100)		 NULL ,
		b_author                      		VARCHAR2(50)		 NULL ,
		b_publisher                   		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE book_b_no_SEQ;

CREATE SEQUENCE book_b_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orderdetail(
		od_no                         		NUMBER(10)		 NULL ,
		od_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		b_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE orderdetail_od_no_SEQ;

CREATE SEQUENCE orderdetail_od_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_title                       		VARCHAR2(100)		 NULL ,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_grade                       		NUMBER(10)		 NULL ,
		r_contents                    		VARCHAR2(2000)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL ,
		od_no                         		NUMBER(10)		 NULL ,
		r_groupno                     		NUMBER(10)		 NULL ,
		r_step                        		NUMBER(10)		 NULL ,
		r_depth                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		c_no                          		NUMBER(10)		 NULL ,
		c_qty                         		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL ,
		b_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_c_no_SEQ;

CREATE SEQUENCE cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE ebook(
		e_no                          		NUMBER(10)		 NULL ,
		e_price                       		NUMBER(10)		 NULL ,
		b_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE ebook_e_no_SEQ;

CREATE SEQUENCE ebook_e_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE eorder(
		eo_no                         		NUMBER(10)		 NULL ,
		eo_date_buy                   		DATE		 DEFAULT sysdate		 NULL ,
		eo_date_end                   		DATE		 NULL ,
		e_no                          		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE eorder_eo_no_SEQ;

CREATE SEQUENCE eorder_eo_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (u_id);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (n_no);

ALTER TABLE QNA ADD CONSTRAINT IDX_QNA_PK PRIMARY KEY (q_no);
ALTER TABLE QNA ADD CONSTRAINT IDX_QNA_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id);

ALTER TABLE book ADD CONSTRAINT IDX_book_PK PRIMARY KEY (b_no);

ALTER TABLE orderdetail ADD CONSTRAINT IDX_orderdetail_PK PRIMARY KEY (od_no);
ALTER TABLE orderdetail ADD CONSTRAINT IDX_orderdetail_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no) on delete cascade;
ALTER TABLE orderdetail ADD CONSTRAINT IDX_orderdetail_FK1 FOREIGN KEY (b_no) REFERENCES book (b_no);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (od_no) REFERENCES orderdetail (od_no) on delete cascade;

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (b_no) REFERENCES book (b_no);

ALTER TABLE ebook ADD CONSTRAINT IDX_ebook_PK PRIMARY KEY (e_no);
ALTER TABLE ebook ADD CONSTRAINT IDX_ebook_FK0 FOREIGN KEY (b_no) REFERENCES book (b_no);

ALTER TABLE eorder ADD CONSTRAINT IDX_eorder_PK PRIMARY KEY (eo_no);
ALTER TABLE eorder ADD CONSTRAINT IDX_eorder_FK0 FOREIGN KEY (e_no) REFERENCES ebook (e_no);
ALTER TABLE eorder ADD CONSTRAINT IDX_eorder_FK1 FOREIGN KEY (u_id) REFERENCES userinfo (u_id);

