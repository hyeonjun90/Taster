package bean;

import java.util.Date;

public class ReviewBean { //식당 리뷰 bean 
	private int review_idx;		// 기본키
	private String r_title;		// 제목
	private String r_content;	// 내용
	private int r_score;		// 리뷰 평점(별 5개 만점)
	private int r_pungga;		// 평가(1.맛있다, 2.괜찮다, 3.별로)
	private String r_image; 	// 리뷰 이미지
	private Date r_regdate; 	// 리뷰 작성일
	private String member_id; 	// Member테이블의 member_id 
	private int shop_idx; 		// Shop(맛집) 테이블의 idx
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public int getR_pungga() {
		return r_pungga;
	}
	public void setR_pungga(int r_pungga) {
		this.r_pungga = r_pungga;
	}
	public String getR_image() {
		return r_image;
	}
	public void setR_image(String r_image) {
		this.r_image = r_image;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
	
	
}
