package foods;

import java.io.IOException;
import java.io.Reader;

import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.*; 

public class FoodsMenuListAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private FoodsMenuListBean fBean;	//식당 bean
	private ArrayList<FoodsMenuListBean> fList; // 식당 리스트 담을 배열
	private int fTotalCount;	// 식당 전체 개수
	
	int currentPage; 
	int pageSize = 3; // 한 페이지에 표시할 목록 개수
	int beforeSize;
	
	
	private String category;
	
	//생성자
	public FoodsMenuListAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	public String readMore() throws Exception {
		setCategory("menu");
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = getCurrentPage();
		beforeSize = pageSize * currentPage - 3; // 페이징 개수
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		
		System.out.println("beforeSize : " + beforeSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("-----------");
		fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuList", pagingMap);
		
		
		//System.out.println("fTotalCount : " + fTotalCount);
		//System.out.println("currentPage : " + currentPage);
		return SUCCESS;
	}
	public String form() throws Exception{  //foods_menu_list.jsp로 폼이동
		setCategory("menu");
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		
		currentPage = 1;
		beforeSize = 0;
		fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
		
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
		fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuList", pagingMap);
		
		fTotalCount -= fList.size();
		
		return SUCCESS;
	}
	
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}


	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}


	public int getfTotalCount() {
		return fTotalCount;
	}


	public void setfTotalCount(int fTotalCount) {
		this.fTotalCount = fTotalCount;
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


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
}