package foods;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.SessionAware;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.*;

public class FoodsHotListAction  extends ActionSupport implements SessionAware {
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private FoodsHotListBean fBean;
	
	private ArrayList<FoodsHotListBean> fList;
	private int fTotalCount;
	
	int currentPage;
	int pageSize = 3;
	int beforeSize;
	
	private Map session;
	private ArrayList<Integer> bookList;
	String member_id;
	
	private String category; // 상단 메뉴 색깔 표시
	
	//생성자
	public FoodsHotListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String readMore() throws Exception{
		
		fBean = new FoodsHotListBean();
		fList = new ArrayList();
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = getCurrentPage();
		beforeSize = pageSize * currentPage - 3; // 페이징 개수
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		System.out.println("beforeSize : " + beforeSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("-----------");
		fList = (ArrayList<FoodsHotListBean>) sqlMapper.queryForList("hotShop-list-selectAll", pagingMap);
		if(session.get("member_id") != null) {
			member_id = session.get("member_id").toString();
		} else {
			member_id = "";
		}
		bookList = (ArrayList<Integer>) sqlMapper.queryForList("bookList", member_id);
		return SUCCESS;
	}
		
	public String form() throws Exception { //food_hot_list.jsp로 이동 
		
		setCategory("hot");
		fBean= new FoodsHotListBean();
		fList = new ArrayList<>();
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
		
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
		fList = (ArrayList<FoodsHotListBean>) sqlMapper.queryForList("hotShop-list-selectAll",pagingMap);
		if(session.get("member_id") != null) {
			member_id = session.get("member_id").toString();
		} else {
			member_id = "";
		}
		bookList = (ArrayList<Integer>) sqlMapper.queryForList("bookList", member_id);
		fTotalCount -= fList.size();
		
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}

	
	
	public FoodsHotListBean getfBean() {
		return fBean;
	}

	public void setfBean(FoodsHotListBean fBean) {
		this.fBean = fBean;
	}

	public ArrayList<FoodsHotListBean> getfList() {
		return fList;
	}

	public void setfList(ArrayList<FoodsHotListBean> fList) {
		this.fList = fList;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
