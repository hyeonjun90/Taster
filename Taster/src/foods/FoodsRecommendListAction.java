package foods;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class FoodsRecommendListAction  extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String category; // ��� �޴� ���� ǥ��
	
	//������
	public FoodsRecommendListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
		
	public String form() throws Exception {
		setCategory("recom");
		return SUCCESS;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}