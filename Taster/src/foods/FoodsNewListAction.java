package foods;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.SessionAware;



import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.*;

public class FoodsNewListAction  extends ActionSupport {
	
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü

	private List<Join_R_S> newShopResult = new ArrayList<Join_R_S>();  //Ư���Ⱓ�� shop ����Ʈ�� �����ϱ� ���� List
	private List<Join_R_S> newShopList = new ArrayList<Join_R_S>(); //Ư���Ⱓ�� shop ����Ʈ���� member�� ������ �������� ���� ����Ʈ   
	
	private int shop_idx;			// �⺻Ű
	private String shop_name;		// �Ĵ��
	private String shop_addr1;		// �Ĵ��ּ�1(Ư����, ������, ��)
	private String shop_addr2;		// �Ĵ��ּ�2(��, ��, ��)
	private String shop_addr3;		// �Ĵ��ּ�3(��)
	private String shop_addr4;		// �Ĵ��ּ�4(������)
	private String file_orgname;
	private String file_savname;
	
	private String member_id; 	// Member���̺��� member_id 
	private String r_content;	// ����
	private int avg_r_score;     //�Ĵ� ���� ��ü ��� 
	
	//������
	public FoodsNewListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	
	//food_new_list ������ �̵� 
	public String form() throws Exception {  		
		return SUCCESS;
	}
	
	//���� 
	public String execute() throws Exception{		
		
		newShopResult = sqlMapper.queryForList("newShop-selectAll");
		
		return SUCCESS;
	}
	

	
	
	
	
	
	
	public List<Join_R_S> getNewShopList() {
		return newShopList;
	}

	public void setNewShopList(List<Join_R_S> newShopList) {
		this.newShopList = newShopList;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getAvg_r_score() {
		return avg_r_score;
	}

	public void setAvg_r_score(int avg_r_score) {
		this.avg_r_score = avg_r_score;
	}
	
	public List<Join_R_S> getNewShopResult() {
		return newShopResult;
	}

	public void setNewShopResult(List<Join_R_S> newShopResult) {
		this.newShopResult = newShopResult;
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

}