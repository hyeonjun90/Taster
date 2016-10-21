package member;

import java.io.IOException;
import java.io.Reader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.ZipcodeBean;

public class ShopZipcodeAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private int r_idx;

	private String  r_shop_addr1; //주소1(도/시)
	private String  r_shop_addr2; //주소2(시,구,군)
	private String  r_shop_addr3; //주소3(동)
	private String r_shop_addr4; //주소4(나머지)
	private String dong;
	
	private ArrayList<ZipcodeBean> zipList;
	
	
	public ShopZipcodeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	
	public String shopZipcode() throws Exception{ //우편번호 검색 폼 열rl
		return SUCCESS;
	}
	
	public String shopZipcodeSearh() throws Exception{
		zipList = new ArrayList<>();
		
		String keyword = "%"+URLDecoder.decode(getDong(), "utf-8")+"%";
		
		System.out.println(keyword);
		zipList = (ArrayList<ZipcodeBean>)sqlMapper.queryForList("zipcodeSearch",keyword);
		System.out.println(zipList.size());
		return SUCCESS;
	}
 	

	public int getR_Idx() {
		return r_idx;
	}

	public void setR_Idx(int r_idx) {
		this.r_idx = r_idx;
	}



	public void setZipList(ArrayList<ZipcodeBean> zipList) {
		this.zipList = zipList;
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

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public ArrayList<ZipcodeBean> getZipList() {
		return zipList;
	}

	

	
}
