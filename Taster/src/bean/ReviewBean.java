package bean;

import java.util.Date;

public class ReviewBean { //�Ĵ� ���� bean 
	private int review_idx;		// �⺻Ű
	private String r_title;		// ����
	private String r_content;	// ����
	private int r_score;		// ���� ����(�� 5�� ����)
	private int r_pungga;		// ��(1.���ִ�, 2.������, 3.����)
	private String r_image; 	// ���� �̹���
	private Date r_regdate; 	// ���� �ۼ���
	private String member_id; 	// Member���̺��� member_id 
	private int shop_idx; 		// Shop(����) ���̺��� idx
	
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
