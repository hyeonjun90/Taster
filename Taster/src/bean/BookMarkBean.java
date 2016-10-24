package bean;

public class BookMarkBean { // 즐겨찾기
	private int bookmark_idx;	// 기본키
	private String member_id;	//MEMBER테이블의 member_id
	private int shop_idx;		//SHOP테이블의 shop_idx
	
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
	
	
}
