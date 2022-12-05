package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.itwill.book.dao.ReviewDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Review;

public class ReviewDaoTest {

	public static void main(String[] args) throws Exception {
		/*
	private int r_no;
	private String r_title;
	private Date r_date;
	private int r_grade;
	private String r_contents;
	private String u_id;
	private OrderDetail orderDetail;
	private int r_groupno;
	private int r_step;
	private int r_depth;
		 */
		
		ReviewDao reviewDao = new ReviewDao();
		
		//리뷰등록
		Review insertReview = new Review(0, "dao리뷰제목", null, 5, "dao리뷰내용", "jihun", 
								new OrderDetail(1, 0, 1, 
									new Book(4, null, null, 0, null, null, null, null)), 
								0, 0, 0);
		//System.out.println("insertReview : "+reviewDao.create(insertReview));
		
		
/*		
		Review tempReview = reviewDao.reviewSelectNo(27);
		System.out.println(tempReview);
		//리뷰 댓글 등록
		Review insertReplyReview = new Review(0, ">>dao리뷰댓글제목", null, 0, "dao리뷰댓글내용", "enbi", 
									new OrderDetail(0, 0, 0, 
										new Book(0, null, null, 0, null, null, null, null)), 
									tempReview.getR_groupno(), 
									tempReview.getR_step(), 
									tempReview.getR_depth());
		System.out.println("insertReplyReview : "+ reviewDao.createReply(insertReplyReview));
*/		
		
		
		
		//리뷰 번호로 리뷰 수정
		Review updateReview = new Review(29, "dao리뷰제목수정", null, 4, "dao리뷰내용수정", "jihun", 
								new OrderDetail(1, 0, 1, 
									new Book(4, null, null, 0, null, null, null, null)), 
								0, 0, 0);
		System.out.println("updateReview : "+ reviewDao.reviewUpdateByNo(updateReview));
		
		//리뷰 번호로 리뷰 삭제
		System.out.println("deleteReview : "+reviewDao.reviewDeleteByNo(26));
		
		//리뷰 원글을 삭제하면 댓글까지 모두 삭제
		//System.out.println("deleteReviewNoAll : "+reviewDao.reviewDeleteByNoAll(0));
		
		
		//리뷰 번호로 리뷰 조회
		System.out.println("selectReviewR_no : "+ reviewDao.reviewSelectNo(7));
		
		
		//책 번호로 리뷰 조회
		List<Review> reviewBookList = new ArrayList<Review>();
		Review findReview = new Review(0, null, null, 0, null, null, 
				new OrderDetail(0, 0, 0, 
						new Book(1, null, null, 0, null, null, null, null)), 0, 0, 0);
		//reviewBookList = reviewDao.reviewSelectByBookNo(findReview);
		for (Review review : reviewBookList) {
			System.out.println("책 번호 조회 : "+review);
		}

		
		//회원 아이디로 리뷰 조회
		List<Review> reviewIdList = reviewDao.reviewSelectByUserId("jihun");
		for (Review review : reviewIdList) {
			//System.out.println(review);
		}
		
		//총 리뷰 수 조회
		System.out.println("총 리뷰 수 : "+ reviewDao.reviewCountAll());
		
		//해당 리뷰의 총 댓글 수
		System.out.println("해당 리뷰의 총 댓글 수 : "+ reviewDao.reviewReplyCount(4));
		
		
		
		
	}
}
