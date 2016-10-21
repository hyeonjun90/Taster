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
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	private PositionBean testBean;
	private ShopBean shopBean;
	ArrayList<ShopBean> newShopList; // �ű� �Ĵ� ����Ʈ
	
	//������
	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
		
	public String execute() throws Exception {
		//�ű� ���� ��������
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
 













