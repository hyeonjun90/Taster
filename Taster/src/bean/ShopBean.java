package bean;

import java.util.Date;

public class ShopBean { //���� bean
	private int shop_idx;			// �⺻Ű
	private String shop_name;		// �Ĵ��
	private String shop_tel;		// ����
	private String shop_kind;		// ����
	private String shop_addr1;		// �Ĵ��ּ�1(Ư����, ������, ��)
	private String shop_addr2;		// �Ĵ��ּ�2(��, ��, ��)
	private String shop_addr3;		// �Ĵ��ּ�3(��)
	private String shop_addr4;		// �Ĵ��ּ�4(������)
	private String shop_price;		// ���ݴ�
	private String shop_holiday;	// ����
	private int shop_readCount;		// ��ȸ��
	private Date shop_regDate; //
	private String file_orgname;
	private String file_savname;
	
	

	
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
	
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public Date getShop_regDate() {
		return shop_regDate;
	}
	public void setShop_regDate(Date shop_regDate) {
		this.shop_regDate = shop_regDate;
	}
	
	
}
