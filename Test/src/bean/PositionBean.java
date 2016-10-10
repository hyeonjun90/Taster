package bean;

public class PositionBean {
	private int p_idx;
	private String member_level; // 1.유저 2.에디터 3.관리자
	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	
	
}
