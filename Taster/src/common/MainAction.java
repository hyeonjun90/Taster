package common;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.PositionBean;
import bean.ShopBean;

public class MainAction extends ActionSupport {
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	private PositionBean testBean;
	private ShopBean shopBean;
	ArrayList<ShopBean> newShopList; // 신규 식당 리스트
	
	//생성자
	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
		
	public String execute() throws Exception {
		//신규 맛집 가져오기
		newShopList = new ArrayList<>();
		newShopList = (ArrayList<ShopBean>) sqlMapper.queryForList("newShopList");
		return SUCCESS;
	}

	
	
	public PositionBean getTestBean() {
		return testBean;
	}
	public void setTestBean(PositionBean testBean) {
		this.testBean = testBean;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	public ArrayList<ShopBean> getNewShopList() {
		return newShopList;
	}

	public void setNewShopList(ArrayList<ShopBean> newShopList) {
		this.newShopList = newShopList;
	}
	
	
	
}
 













