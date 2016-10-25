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

public class FoodsNewListAction  extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private FoodsNewListBean fBean;      //FoodNewList bean
	private ArrayList<FoodsNewListBean> fList; //식당 리스트를 담을 배열
	private int fTotalCount;	// 식당 전체 개수

	int currentPage;
	int pageSize = 3;
	int beforeSize;
	
	//생성자
	public FoodsNewListAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
public String readMore() throws Exception{
		
		fBean = new FoodsNewListBean();
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
		fList = (ArrayList<FoodsNewListBean>) sqlMapper.queryForList("newShop-selectAll", pagingMap);
		
		return SUCCESS;
	}
	
	
	public String form() throws Exception{  //foods_new_list.jsp로 폼 이동 
		
		fBean = new FoodsNewListBean();
		fList = new ArrayList<>();
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		fTotalCount = (int)sqlMapper.queryForObject("foodsMenuListCount");
		
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
		fList = (ArrayList<FoodsNewListBean>) sqlMapper.queryForList("newShop-selectAll",pagingMap);
		
		fTotalCount -= fList.size();
		
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	
	public FoodsNewListBean getfBean() {
		return fBean;
	}

	public void setfBean(FoodsNewListBean fBean) {
		this.fBean = fBean;
	}

	public ArrayList<FoodsNewListBean> getfList() {
		return fList;
	}

	public void setfList(ArrayList<FoodsNewListBean> fList) {
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
}