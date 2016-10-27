package foods;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.FoodsMenuListBean;

public class FoodsSearchAction extends ActionSupport implements SessionAware {
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private int fTotalCount;
	
	int currentPage;
	int pageSize = 3;
	int beforeSize;
	
	private Map session;
	private ArrayList<Integer> bookList;
	String member_id;
	
	private FoodsMenuListBean fBean;	//식당 bean
	private ArrayList<FoodsMenuListBean> fList; // 식당 리스트 담을 배열
	
	private String keyword;
	private String topSearch;
	
	//생성자
	public FoodsSearchAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String execute() throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		
		currentPage = 1;
		beforeSize = 0;

		pageSize = pageSize * currentPage;
		
		map.put("beforeSize", beforeSize);
		map.put("pageSize", pageSize);
		
		if(session.get("member_id") != null) {
			member_id = session.get("member_id").toString();
		} else {
			member_id = "";
		}
		
		String keyword = "%"+getKeyword()+"%";
		map.put("keyword", keyword);
		
		if (getTopSearch().equals("shopArea")) { //식당 주소로 검색
			
			fTotalCount = (int) sqlMapper.queryForObject("foodsTopAreaSearchCount", keyword);
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsTopAreaSearch", map);
		} else { // 식당명으로 검색
			fTotalCount = (int) sqlMapper.queryForObject("foodsTopNameSearchCount", keyword);
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsTopNameSearch", map);
		}
		
		
		bookList = (ArrayList<Integer>) sqlMapper.queryForList("bookList", member_id);
		
		return SUCCESS;
	}
	
	public int getfTotalCount() {
		return fTotalCount;
	}

	public void setfTotalCount(int fTotalCount) {
		this.fTotalCount = fTotalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBeforeSize() {
		return beforeSize;
	}

	public void setBeforeSize(int beforeSize) {
		this.beforeSize = beforeSize;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public ArrayList<Integer> getBookList() {
		return bookList;
	}

	public void setBookList(ArrayList<Integer> bookList) {
		this.bookList = bookList;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public FoodsMenuListBean getfBean() {
		return fBean;
	}

	public void setfBean(FoodsMenuListBean fBean) {
		this.fBean = fBean;
	}

	public ArrayList<FoodsMenuListBean> getfList() {
		return fList;
	}

	public void setfList(ArrayList<FoodsMenuListBean> fList) {
		this.fList = fList;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTopSearch() {
		return topSearch;
	}

	public void setTopSearch(String topSearch) {
		this.topSearch = topSearch;
	}
	
	
}




































