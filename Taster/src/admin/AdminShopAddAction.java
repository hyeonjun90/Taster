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
	
private ShopBean paramClass; //�Ķ���͸� ���� �� ��ü
private ShopBean resultClass;// ���� ��� �� ���� ��ü
	


private String shop_name;
private String shop_tel;
private String shop_price;
private String shop_kind;		// ����
//private String shop_addr1;		// �Ĵ��ּ�1(Ư����, ������, ��)
//private String shop_addr2;		// �Ĵ��ּ�2(��, ��, ��)
//private String shop_addr3;		// �Ĵ��ּ�3(��)
//private String shop_addr4;		// �Ĵ��ּ�4(������)
private String shop_holiday;	// ����
private int shop_readCount;		// ��ȸ��
private int shop_new; 			// �ű� ����(1.�ű�, 2.��ű�)


public AdminShopAddAction() throws IOException {
	
	reader = Resources.getResourceAsReader("sqlMapConfig.xml");
	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
	reader.close();
}

public String form() throws Exception {
	//��� ��.
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
	