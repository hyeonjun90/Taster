package bean;

import java.util.Date;

public class RequestListBean {

	private int r_idx; //인덱스 기본키
	private Date r_regdate; //요청글 작성일
	private String r_id; //작성자 아이디
	private String r_nicname; //작성자 닉넴임
	private String r_shop_name; //가게이름
	private String r_shop_tel; //가게전화번호
	private String r_shop_kind; //업종
	private String r_shop_addr1; //주소1(도/시)
	private String r_shop_addr2; //주소2(시/구)
	private String r_shop_addr3; //주소3(구/군)
	private String r_shop_addr4; //주소4(동+나머지)
	private String r_shop_price; //가격대
	private String r_shop_holiday; //휴일
	private String r_shop_content; //입력내용
	private String r_shop_file_orgname; //파일원본이름
	private String r_shop_file_savname; //파일저장명
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_nicname() {
		return r_nicname;
	}
	public void setR_nicname(String r_nicname) {
		this.r_nicname = r_nicname;
	}
	public String getR_shop_name() {
		return r_shop_name;
	}
	public void setR_shop_name(String r_shop_name) {
		this.r_shop_name = r_shop_name;
	}
	public String getR_shop_tel() {
		return r_shop_tel;
	}
	public void setR_shop_tel(String r_shop_tel) {
		this.r_shop_tel = r_shop_tel;
	}
	public String getR_shop_kind() {
		return r_shop_kind;
	}
	public void setR_shop_kind(String r_shop_kind) {
		this.r_shop_kind = r_shop_kind;
	}
	public String getR_shop_addr1() {
		return r_shop_addr1;
	}
	public void setR_shop_addr1(String r_shop_addr1) {
		this.r_shop_addr1 = r_shop_addr1;
	}
	public String getR_shop_addr2() {
		return r_shop_addr2;
	}
	public void setR_shop_addr2(String r_shop_addr2) {
		this.r_shop_addr2 = r_shop_addr2;
	}
	public String getR_shop_addr3() {
		return r_shop_addr3;
	}
	public void setR_shop_addr3(String r_shop_addr3) {
		this.r_shop_addr3 = r_shop_addr3;
	}
	public String getR_shop_addr4() {
		return r_shop_addr4;
	}
	public void setR_shop_addr4(String r_shop_addr4) {
		this.r_shop_addr4 = r_shop_addr4;
	}
	public String getR_shop_price() {
		return r_shop_price;
	}
	public void setR_shop_price(String r_shop_price) {
		this.r_shop_price = r_shop_price;
	}
	public String getR_shop_holiday() {
		return r_shop_holiday;
	}
	public void setR_shop_holiday(String r_shop_holiday) {
		this.r_shop_holiday = r_shop_holiday;
	}
	public String getR_shop_content() {
		return r_shop_content;
	}
	public void setR_shop_content(String r_shop_content) {
		this.r_shop_content = r_shop_content;
	}
	public String getR_shop_file_orgname() {
		return r_shop_file_orgname;
	}
	public void setR_shop_file_orgname(String r_shop_file_orgname) {
		this.r_shop_file_orgname = r_shop_file_orgname;
	}
	public String getR_shop_file_savname() {
		return r_shop_file_savname;
	}
	public void setR_shop_file_savname(String r_shop_file_savname) {
		this.r_shop_file_savname = r_shop_file_savname;
	}
	
	
	
}
