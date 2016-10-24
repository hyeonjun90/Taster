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
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<Join_R_S> newShopResult = new ArrayList<Join_R_S>();  //특정기간의 shop 리스트를 저장하기 위한 List
	private List<Join_R_S> newShopList = new ArrayList<Join_R_S>(); //특정기간의 shop 리스트에서 member와 조인해 평점까지 합한 리스트   
	
	private int shop_idx;			// 기본키
	private String shop_name;		// 식당명
	private String shop_addr1;		// 식당주소1(특별시, 광역시, 도)
	private String shop_addr2;		// 식당주소2(시, 구, 군)
	private String shop_addr3;		// 식당주소3(동)
	private String shop_addr4;		// 식당주소4(나머지)
	private String file_orgname;
	private String file_savname;
	
	private String member_id; 	// Member테이블의 member_id 
	private String r_content;	// 내용
	private int avg_r_score;     //식당 리뷰 전체 평균 
	
	//생성자
	public FoodsNewListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	
	//food_new_list 폼으로 이동 
	public String form() throws Exception {  		
		return SUCCESS;
	}
	
	//실행 
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