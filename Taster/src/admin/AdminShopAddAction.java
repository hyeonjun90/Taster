package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import bean.ShopBean;

public class AdminShopAddAction extends ActionSupport{
public static Reader reader;
public static SqlMapClient sqlMapper;
	
private ShopBean paramClass; //파라미터를 저장 할 객체
private ShopBean resultClass;// 쿼리 결과 값 저장 객체
	


private String shop_name;
private String shop_tel;
private String shop_price;
private String shop_kind;		// 업종
//private String shop_addr1;		// 식당주소1(특별시, 광역시, 도)
//private String shop_addr2;		// 식당주소2(시, 구, 군)
//private String shop_addr3;		// 식당주소3(동)
//private String shop_addr4;		// 식당주소4(나머지)
private String shop_holiday;	// 휴일
private int shop_readCount;		// 조회수
private int shop_new; 			// 신규 여부(1.신규, 2.비신규)


public AdminShopAddAction() throws IOException {
	
	reader = Resources.getResourceAsReader("sqlMapConfig.xml");
	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
	reader.close();
}

public String form() throws Exception {
	//등록 폼.
	return SUCCESS;
}

public String execute() throws Exception  {
	
	paramClass = new ShopBean();
	resultClass = new ShopBean();
	
	paramClass.setShop_name(shop_name);
	paramClass.setShop_tel(shop_tel);
	paramClass.setShop_price(shop_price);
	paramClass.setShop_kind(shop_kind);
	//paramClass.setShop_addr1(shop_addr1);
	//paramClass.setShop_addr2(shop_addr2);
	//paramClass.setShop_addr3(shop_addr3);
	//paramClass.setShop_addr4(shop_addr4);
	paramClass.setShop_holiday(shop_holiday);
	paramClass.setShop_readCount(shop_readCount);
	paramClass.setShop_new(shop_new);
	
	
	sqlMapper.insert("Shop-insertAshop",paramClass);
	
	return "success";
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

public static SqlMapClient getSqlMapper() {
	return sqlMapper;
}

public static void setSqlMapper(SqlMapClient sqlMapper) {
	AdminShopAddAction.sqlMapper = sqlMapper;
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

public static Reader getReader() {
	return reader;
}

public static void setReader(Reader reader) {
	AdminShopAddAction.reader = reader;
}

public String getShop_kind() {
	return shop_kind;
}

public void setShop_kind(String shop_kind) {
	this.shop_kind = shop_kind;
}
/**
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
**/
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

public int getShop_new() {
	return shop_new;
}

public void setShop_new(int shop_new) {
	this.shop_new = shop_new;
}



}
	