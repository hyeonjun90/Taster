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
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private String shop_idx;
	private Map session;
	
	private int checkBookMark;
	
	//생성자
	public BookMarkAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
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

























