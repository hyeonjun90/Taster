package admin;

import com.opensymphony.xwork2.ActionSupport;

import bean.ShopBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;


public class AdminShopAddAction extends ActionSupport {
	
public static SqlMapClient sqlMapper; 

private ShopBean paramClass; //파라미터를 저장할 객체
private ShopBean resultClass; //쿼리 결과 값을 저장할 객체

private int currentPage; //현재 페이지

private String shop_name;
private String shop_tel;
private String shop_price;
private String shop_addr1;
private String shop_addr2;
private String shop_addr3;
private String shop_addr4;

//게시판 WRITE 액션
	public String execute() throws Exception {

		//파라미터와 리절트 객체 생성.
		paramClass = new ShopBean();
		resultClass = new ShopBean();

		// 등록할 항목 설정.
		paramClass.setShop_name(getShop_name());
		paramClass.setShop_tel(getShop_tel());
		paramClass.setShop_price(getShop_price());
		paramClass.setShop_addr1(getShop_addr1());
		paramClass.setShop_addr2(getShop_addr2());
		paramClass.setShop_addr3(getShop_addr3());
		paramClass.setShop_addr4(getShop_addr4());
		

		// 등록 쿼리 수행.
		sqlMapper.insert("insertShop", paramClass);
		
		return SUCCESS;
}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminShopAddAction.sqlMapper = sqlMapper;
	}

	public ShopBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(ShopBean paramClass) {
		this.paramClass = paramClass;
	}

	public ShopBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(ShopBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getShop_price() {
		return shop_price;
	}

	public void setShop_price(String shop_price) {
		this.shop_price = shop_price;
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

	
}
