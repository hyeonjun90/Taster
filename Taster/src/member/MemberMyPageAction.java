package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import bean.BookMarkBean;
import bean.ReviewBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MemberMyPageAction extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private List<ReviewBean> reviewList = new ArrayList<ReviewBean>(); 
	private List<BookMarkBean> bookMarkList =new ArrayList<BookMarkBean>();
	
	public MemberMyPageAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String form() throws Exception {
		
		
		
		
		return SUCCESS;
	}
}
