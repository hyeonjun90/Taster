package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import bean.*;
import member.*;
import common.*;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import common.PagingAction;

public class MemberMyPageAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ReviewListBean rBean;
	private BookmarkListBean bBean;
	
	private ArrayList<ReviewListBean> rList;
	private ArrayList<BookmarkListBean> bList;
	
	private int shopTotalCount;  //�Ĵ� ��ü ����
	
	
	int currentPage;
	int pageSize = 3;
	int beforeSize;
	
	
	private Map session;
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	public Map getSession() {
		return session;
	}

	
	//������
	public MemberMyPageAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		System.out.println("���� : " + session.get("member_id"));
		
		reviewListform();
		bookmarkListform();
		
		return SUCCESS;
	}
	
	public String reviewReaderMore() throws Exception{
		 
		rBean = new ReviewListBean();
		rList = new ArrayList();
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = getCurrentPage();
		beforeSize = pageSize * currentPage - 3; // ����¡ ����
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		System.out.println("beforeSize : " + beforeSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("-----------");
		rList = (ArrayList<ReviewListBean>) sqlMapper.queryForList("reviewListCount", pagingMap);
		
		return SUCCESS;
	}
	
	public String bookmarkReaderMore() throws Exception{
		 
		bBean = new BookmarkListBean();
		bList = new ArrayList();
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = getCurrentPage();
		beforeSize = pageSize * currentPage - 3; // ����¡ ����
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		System.out.println("beforeSize : " + beforeSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("-----------");
		
		bList = (ArrayList<BookmarkListBean>) sqlMapper.queryForList("bookmarkListCount", pagingMap);
		
		return SUCCESS;
	}
	

	
	public String reviewListform() throws Exception{    //reviewList ���ؿ��� �żҵ�
		
		rBean = new ReviewListBean();
		rList = new ArrayList<>();
		
		shopTotalCount = (int)sqlMapper.queryForObject("foodsMenuListCount");   //�Ĵ� ��ü ī���� ���ִ� ������ 
		
		rList=(ArrayList<ReviewListBean>) sqlMapper.queryForList("reviewList-selectAll", session.get("member_id"));
		
		return SUCCESS;
		
	}
	
	public String bookmarkListform() throws Exception{ //bookmarkList ���ؿ��� �żҵ�
		
		bBean = new BookmarkListBean();
		bList = new ArrayList<>();
		
		shopTotalCount = (int)sqlMapper.queryForObject("foodsMenuListCount");   //�Ĵ� ��ü ī���� ���ִ� ������ 
		
		bList=(ArrayList<BookmarkListBean>) sqlMapper.queryForList("bookmarkList-selecAll", session.get("member_id"));
		
		return SUCCESS;
	}
	
	
	public ReviewListBean getrBean() {
		return rBean;
	}

	public void setrBean(ReviewListBean rBean) {
		this.rBean = rBean;
	}

	public BookmarkListBean getbBean() {
		return bBean;
	}

	public void setbBean(BookmarkListBean bBean) {
		this.bBean = bBean;
	}

	public ArrayList<ReviewListBean> getrList() {
		return rList;
	}

	public void setrList(ArrayList<ReviewListBean> rList) {
		this.rList = rList;
	}

	public ArrayList<BookmarkListBean> getbList() {
		return bList;
	}

	public void setbList(ArrayList<BookmarkListBean> bList) {
		this.bList = bList;
	}

	public int getShopTotalCount() {
		return shopTotalCount;
	}

	public void setShopTotalCount(int shopTotalCount) {
		this.shopTotalCount = shopTotalCount;
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
