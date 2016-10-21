package bean;

import java.util.Date;

public class JoinR_B_S {
	
	private int bookmark_idx;	// 기본키
	private String member_id;	//MEMBER테이블의 member_id
	
	private int shop_idx;		//SHOP테이블의 shop_idx
	
	private String shop_name;		// 식당명
	private String shop_tel;		// 전번
	private String shop_kind;		// 업종
	private String shop_addr1;		// 식당주소1(특별시, 광역시, 도)
	private String shop_addr2;		// 식당주소2(시, 구, 군)
	private String shop_addr3;		// 식당주소3(동)
	private String shop_addr4;		// 식당주소4(나머지)
	private String shop_price;		// 가격대
	private String shop_holiday;	// 휴일
	private int shop_readCount;		// 조회수
	private Date shop_regDate; 			// 식당 등록일
	
	private int review_idx;		// 기본키
	
	private String r_title;		// 제목
	private String r_content;	// 내용
	private int r_score;		// 리뷰 평점(별 5개 만점)
	private int r_pungga;		// 평가(1.맛있다, 2.괜찮다, 3.별로)
	private String r_image; 	// 리뷰 이미지
	private Date r_regdate; 	// 리뷰 작성일
	
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



	public int getBookmark_idx() {
		return bookmark_idx;
	}
	public void setBookmark_idx(int bookmark_idx) {
		this.bookmark_idx = bookmark_idx;
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
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_tel() {
		return shop_tel;
	}
	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}
	public String getShop_kind() {
		return shop_kind;
	}
	public void setShop_kind(String shop_kind) {
		this.shop_kind = shop_kind;
	}
	public String getShop_addr1() {
		return shop_addr1;
	}
	public void setShop_addr1(String shop_addr1) {
		this.shop_addr1 = shop_addr1;
	}
	public String getShop_addr2() {
		return shop_addr2;
	}
	public void setShop_addr2(String shop_addr2) {
		this.shop_addr2 = shop_addr2;
	}
	public String getShop_addr3() {
		return shop_addr3;
	}
	public void setShop_addr3(String shop_addr3) {
		this.shop_addr3 = shop_addr3;
	}
	public String getShop_addr4() {
		return shop_addr4;
	}
	public void setShop_addr4(String shop_addr4) {
		this.shop_addr4 = shop_addr4;
	}
	public String getShop_price() {
		return shop_price;
	}
	public void setShop_price(String shop_price) {
		this.shop_price = shop_price;
	}
	public String getShop_holiday() {
		return shop_holiday;
	}
	public void setShop_holiday(String shop_holiday) {
		this.shop_holiday = shop_holiday;
	}
	public int getShop_readCount() {
		return shop_readCount;
	}
	public void setShop_readCount(int shop_readCount) {
		this.shop_readCount = shop_readCount;
	}
	public Date getShop_regDate() {
		return shop_regDate;
	}
	public void setShop_regDate(Date shop_regDate) {
		this.shop_regDate = shop_regDate;
	}
	
	

}
