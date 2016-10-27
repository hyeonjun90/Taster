package foods;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class BookMarkAction extends ActionSupport implements SessionAware {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String shop_idx;
	private Map session;
	
	private int checkBookMark;
	
	//������
	public BookMarkAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String execute() throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_id", session.get("member_id"));
		map.put("shop_idx", getShop_idx());
		
		System.out.println("session.member_id : "+session.get("member_id"));
		System.out.println("getShop_idx : " + getShop_idx());
		checkBookMark = (int)sqlMapper.queryForObject("checkBookMark", map);
		if(checkBookMark == 0) {
			sqlMapper.insert("insertBookMark", map);
		} else {
			sqlMapper.update("deleteBookMark", map);
		}
		return SUCCESS;
	}

	public String getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(String shop_idx) {
		this.shop_idx = shop_idx;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public int getCheckBookMark() {
		return checkBookMark;
	}

	public void setCheckBookMark(int checkBookMark) {
		this.checkBookMark = checkBookMark;
	}
	
}

























