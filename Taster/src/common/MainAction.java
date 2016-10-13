package common;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.PositionBean;

public class MainAction extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	private PositionBean testBean;
	
	//������
	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
		
	public String execute() throws Exception {
		testBean = (PositionBean) sqlMapper.queryForObject("test");
		
		
		return SUCCESS;
	}

	
	
	public PositionBean getTestBean() {
		return testBean;
	}
	public void setTestBean(PositionBean testBean) {
		this.testBean = testBean;
	}
	
	
}
 













