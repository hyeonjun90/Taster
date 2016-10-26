package admin;

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

public class AdminShopZipcodeAction extends ActionSupport {
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private int shop_idx;

	private String  shop_addr1; //주소1(도/시)
	private String  shop_addr2; //주소2(시,구,군)
	private String  shop_addr3; //주소3(동)
	private String  shop_addr4; //주소4(나머지)
	private String  dong;
	
	
	private ArrayList<ZipcodeBean> zipList;
	
	public AdminShopZipcodeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String AdminshopZipcode() throws Exception{ //우편번호 검색 폼 열기
		return SUCCESS;
	}
	
	public String shopZipcodeSearh() throws Exception{
		zipList = new ArrayList<>();
		
		String keyword = "%"+URLDecoder.decode(getDong(), "utf-8")+"%";
		
		System.out.println(keyword);
		zipList = (ArrayList<ZipcodeBean>)sqlMapper.queryForList("AdminZipcodeSearch",keyword);
		System.out.println(zipList.size());
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminShopZipcodeAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminShopZipcodeAction.sqlMapper = sqlMapper;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
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

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public ArrayList<ZipcodeBean> getZipList() {
		return zipList;
	}

	public void setZipList(ArrayList<ZipcodeBean> zipList) {
		this.zipList = zipList;
	}
	
	

}
