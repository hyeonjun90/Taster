package admin;

//import com.opensymphony.xwork2.ActionSupport;
//import com.ibatis.sqlmap.client.SqlMapClient;
//import bean.ShopBean;

public class admin_foods_writeAction{

//public static SqlMapClient sqlMapper;
	
//private ShopBean paramClass; //파라미터를 저장 할 객체
//private ShopBean resultClass;// 쿼리 결과 값 저장 객체
	
private String message;
private String message1;
private String message2;
private String message3;
private String message4;

private String shop_name;
private String shop_tel;
private String shop_price;
private String shop_addr;
private String korean;

public String execute() throws Exception {
	
	//paramClass = new ShopBean();
	//resultClass = new ShopBean();
	
	//paramClass.setShop_name(shop_name);
	//paramClass.setShop_tel(shop_tel);
	//paramClass.setShop_price(shop_price);
	
	//sqlMapper.insert("insertshop",paramClass);
	

	message = shop_name + "";
	message1 = shop_tel + "";
	message2 = shop_price + "";
	message3 = shop_addr + "";
	message4 = korean + "";
	
	return "success";
}

public String getMessage4() {
	return message4;
}

public void setMessage4(String message4) {
	this.message4 = message4;
}

public String getKorean() {
	return korean;
}

public void setKorean(String korean) {
	this.korean = korean;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getShop_name() {
	return shop_name;
}

public void setShop_name(String shop_name) {
	this.shop_name = shop_name;
}



public String getMessage1() {
	return message1;
}



public void setMessage1(String message1) {
	this.message1 = message1;
}



public String getMessage2() {
	return message2;
}



public void setMessage2(String message2) {
	this.message2 = message2;
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





public String getMessage3() {
	return message3;
}





public void setMessage3(String message3) {
	this.message3 = message3;
}





public String getShop_addr() {
	return shop_addr;
}





public void setShop_addr(String shop_addr) {
	this.shop_addr = shop_addr;
}

/**public ShopBean getParamClass() {
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
**/


}
	