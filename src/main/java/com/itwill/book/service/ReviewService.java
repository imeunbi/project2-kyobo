package com.itwill.book.service;

import java.util.List;


import com.itwill.book.common.PageMaker;
import com.itwill.book.dao.ReviewDao;
import com.itwill.book.dto.Review;
import com.itwill.book.dto.ReviewBookListPageMakerDto;


public class ReviewService {
	private static ReviewService _instance;
	
	private ReviewDao reviewDao;
	
	public ReviewService() throws Exception{
		reviewDao = new ReviewDao();
	}
	
	public static ReviewService getInstance() throws Exception{
		if(_instance==null) {
			_instance=new ReviewService();
		}
		return _instance;
	}
	

	//리뷰생성
	public int create(Review review) throws Exception{
		return reviewDao.create(review);
	}
	
	//리뷰댓글작성
	public int createReply(Review review)throws Exception{
		return reviewDao.createReply(review);
	}
	
	//리뷰수정
	public int reviewUpdate(Review review) throws Exception{
		return reviewDao.reviewUpdateByNo(review);
	}
	
	//리뷰삭제 -- 댓글 삭제에 쓰려나
	public int reviewDeleteByNo(int r_no) throws Exception{
		return reviewDao.reviewDeleteByNo(r_no);
	}
	
	//리뷰 원글을 삭제하면 댓글까지 모두 삭제
	public int reviewDeleteByNoAll (int r_groupno) throws Exception{
		return reviewDao.reviewDeleteByNoAll(r_groupno);
	}
	
	
	//리뷰 번호로 리뷰조회 - 상품페이지 리뷰상세, 마이페이지 리뷰상세
	public Review reviewSelectNo(int r_no) throws Exception{
		return reviewDao.reviewSelectNo(r_no);
	}
	
	
	//책 번호로 리뷰 조회- 상품페이지에서
	public List<Review> reviewSelectByBookNo(Review review) throws Exception{
		return reviewDao.reviewSelectByBookNo(review);
	}
	
/*	
	//책 번호로 리뷰 조회- 상품페이지에서
	public List<Review> reviewSelectByBookNo(int b_no) throws Exception{
		return reviewDao.reviewSelectByBookNo(b_no);
	}
*/	
	
	//회원 아이디로 리뷰 조회 - 마이페이지
	public List<Review> reviewSelectByUserId(String u_id) throws Exception{
		return reviewDao.reviewSelectByUserId(u_id);
	}
	
	//총 리뷰 수 구하기
	public int reviewCountAll() throws Exception{
		return reviewDao.reviewCountAll();
	}
	
	//해당 리뷰의 총 댓글 수
	public int reviewReplyCount(int groupno) throws Exception{
		return reviewDao.reviewReplyCount(groupno);
	}
	
	//아이디 리뷰 게시물 리스트
	public ReviewBookListPageMakerDto findReviewIdList(String u_id, int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = reviewDao.reviewCountAll(); // 다시확인
		//2.paging계산(PageMaker 유틸클래스)
		
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
		//3.게시물데이타 얻기
		List<Review> reviewList=
				reviewDao.reviewSelectByUserId(u_id, pageMaker.getPageBegin(),
											pageMaker.getPageEnd());
		
		ReviewBookListPageMakerDto pageMakerReviewList=new ReviewBookListPageMakerDto();
		pageMakerReviewList.totRecordCount=totalRecordCount;
		pageMakerReviewList.itemList=reviewList;
		pageMakerReviewList.pageMaker=pageMaker;
		return pageMakerReviewList;
	}

/*
	//상품 리뷰 게시물 리스트 
		public ReviewBookListPageMakerDto findReviewBookList(int b_no, int currentPage) throws Exception{
			//1.전체글의 갯수
			int totalRecordCount = reviewDao.reviewCountAll(); // 다시확인
			//2.paging계산(PageMaker 유틸클래스)
			
			PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
			//3.게시물데이타 얻기
			Review review = new Review();
			List<Review> reviewList=
					reviewDao.reviewSelectByBookNo(b_no, pageMaker.getPageBegin(), //review.getOrderDetail().getBook().getB_no()
												pageMaker.getPageEnd());
			
			ReviewBookListPageMakerDto pageMakerReviewList=new ReviewBookListPageMakerDto();
			pageMakerReviewList.totRecordCount=totalRecordCount;
			pageMakerReviewList.itemList=reviewList;
			pageMakerReviewList.pageMaker=pageMaker;
			return pageMakerReviewList;
		}
*/		
	
	
	//상품 리뷰 게시물 리스트 
			public ReviewBookListPageMakerDto findReviewBookList(Review review, int currentPage) throws Exception{
				//1.전체글의 갯수
				int totalRecordCount = reviewDao.reviewCountAll(); // 다시확인
				//2.paging계산(PageMaker 유틸클래스)
				
				PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
				//3.게시물데이타 얻기
				List<Review> reviewList=
						reviewDao.reviewSelectByBookNo(review, pageMaker.getPageBegin(), //review.getOrderDetail().getBook().getB_no()
													pageMaker.getPageEnd());
				
				ReviewBookListPageMakerDto pageMakerReviewList=new ReviewBookListPageMakerDto();
				pageMakerReviewList.totRecordCount=totalRecordCount;
				pageMakerReviewList.itemList=reviewList;
				pageMakerReviewList.pageMaker=pageMaker;
				return pageMakerReviewList;
			}

	
	
	
}
