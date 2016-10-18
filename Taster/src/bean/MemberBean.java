package bean;

import java.util.Date;

public class MemberBean {
	private String member_id;
	private String member_pwd;
	private String member_nicname;
	private String member_name;
	private String member_phone;
	private String member_addr;
	private String member_zipcode;
	private String member_image;
	private Date member_joinDate; //가입일
	private Date member_loginDate; // 최근 로그인
	private int member_level;  // 회원 등급 1.유저 2.에디터 3.관리자
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_nicname() {
		return member_nicname;
	}
	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public Date getMember_joinDate() {
		return member_joinDate;
	}
	public void setMember_joinDate(Date member_joinDate) {
		this.member_joinDate = member_joinDate;
	}
	public Date getMember_loginDate() {
		return member_loginDate;
	}
	public void setMember_loginDate(Date member_loginDate) {
		this.member_loginDate = member_loginDate;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	
	
	
}
