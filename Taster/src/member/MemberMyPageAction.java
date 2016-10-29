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
	
	private int shopTotalCount;  //식당 전체 개수
	
	
	int currentPage;
	int pageSize = 3;
	int beforeSize;
	
	private int reviewCount;
	private int bookCount;
	
	private Map session;
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	public Map getSession() {
		return session;
	}

	
	//생성자
	public MemberMyPageAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		System.out.println("세션 : " + session.get("member_id"));
		
		String member_id = session.get("member_id").toString();
		reviewListform();
		bookmarkListform();
		reviewCount = (int) sqlMapper.queryForObject("reviewCount", member_id);
		bookCount = (int) sqlMapper.queryForObject("bookCount", member_id);
		
		return SUCCESS;
	}
	
	public String reviewReaderMore() throws Exception{
		 
		rBean = new ReviewListBean();
		rList = new ArrayList();
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = getCurrentPage();
		beforeSize = pageSize * currentPage - 3; // 페이징 개수
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
		beforeSize = pageSize * currentPage - 3; // 페이징 개수
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		
		System.out.println("beforeSize : " + beforeSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("-----------");
		
		bList = (ArrayList<BookmarkListBean>) sqlMapper.queryForList("bookmarkListCount", pagingMap);
		
		return SUCCESS;
	}
	

	
	public String reviewListform() throws Exception{    //reviewList 구해오는 매소드
		
		rBean = new ReviewListBean();
		rList = new ArrayList<>();
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		shopTotalCount = (int)sqlMapper.queryForObject("reviewListCount");
		
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("member_id", session.get("member_id"));
		
		shopTotalCount = (int) sqlMapper.queryForObject("reviewListCount");
		rList=(ArrayList<ReviewListBean>) sqlMapper.queryForList("reviewList-selectAll", pagingMap);
		
		shopTotalCount -= rList.size();
		
		
		return SUCCESS;
		
	}
	
	public String bookmarkListform() throws Exception{ //bookmarkList 구해오는 매소드
		
		bBean = new BookmarkListBean();
		bList = new ArrayList<>();
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		shopTotalCount = (int)sqlMapper.queryForObject("bookmarkListCount");
		
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("member_id", session.get("member_id"));
		
		shopTotalCount = (int) sqlMapper.queryForObject("bookmarkListCount");
		
		shopTotalCount = (int)sqlMapper.queryForObject("bookmarkListCount");   //식당 전체 카운터 해주는 쿼리문 
		bList=(ArrayList<BookmarkListBean>) sqlMapper.queryForList("bookmarkList-selecAll", pagingMap);
		
		shopTotalCount -= bList.size();
		
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
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}



}
