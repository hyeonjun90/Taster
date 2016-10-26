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
	private FoodsMenuListBean fBean;	//�Ĵ� bean
	private ArrayList<FoodsMenuListBean> fList; // �Ĵ� ����Ʈ ���� �迭
	private int fTotalCount;	// �Ĵ� ��ü ����
	private String keyword; // ������ �˻� Ű����
	
	int currentPage; 
	int pageSize = 3; // �� �������� ǥ���� ��� ����
	int beforeSize;
	
	private String category; // ��� �޴� ���� ǥ��
	
	//������
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
		beforeSize = pageSize * currentPage - 3; // ����¡ ����
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		System.out.println("getKeyword() : " + getKeyword());
		if (getKeyword() == null || getKeyword() == "") 
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuList", pagingMap);
		else {
			pagingMap.put("keyword", getKeyword());
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuListSearch", pagingMap);
		}
		
		
		//System.out.println("fTotalCount : " + fTotalCount);
		//System.out.println("currentPage : " + currentPage);
		return SUCCESS;
	}
	public String form() throws Exception{  //foods_menu_list.jsp�� ���̵�
		setCategory("menu");
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;

		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		if (getKeyword() == null || getKeyword() == "") {
			fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListCount");
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuList", pagingMap);
		} else {
			pagingMap.put("keyword", getKeyword());
			fTotalCount = (int) sqlMapper.queryForObject("foodsMenuListSearchCount", getKeyword());
			fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuListSearch", pagingMap);
			
		}
		
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}