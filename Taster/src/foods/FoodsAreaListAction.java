package foods;

import java.io.IOException;
import java.io.Reader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.FoodsMenuListBean;

public class FoodsAreaListAction extends ActionSupport {
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private ArrayList<String> gugunList;
	private String sido;
	private String gugun;
	private String selected;
	
	private FoodsMenuListBean fBean;	//식당 bean
	private ArrayList<FoodsMenuListBean> fList; // 식당 리스트 담을 배열
	private int fTotalCount;	// 식당 전체 개수
	private String keyword; // 지역별 검색 키워드
	
	int currentPage; 
	int pageSize = 3; // 한 페이지에 표시할 목록 개수
	int beforeSize;
	
	private String category; // 상단 메뉴 색깔 표시
	private String startPage; // 페이지 시작을 강남으로 정하기 위한 변수
	private String startNum;
	
	//생성자
	public FoodsAreaListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
		
	public String form() throws Exception { // 처음 폼 이동했을때 표시는 서울 강남구.
		
		setCategory("area");
		
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		//beforeSize = pageSize * currentPage - 3; // 페이징 개수
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("sido", "서울");
		pagingMap.put("gugun", "강남구");
		
		fTotalCount = (int) sqlMapper.queryForObject("foodsAreaListCount", pagingMap);
		
		fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsAreaList", pagingMap);
		
		return SUCCESS;
	}

	public String areaSearch() throws Exception {
		if(getStartNum().equals("1")) {
			setStartPage("강남구");
		}
		sido = URLDecoder.decode(getSido(), "utf-8");
		gugunList = (ArrayList<String>) sqlMapper.queryForList("searchArea", sido);
		setSelected(sido);
		return SUCCESS;
	}
	
	public String areaSearchList() throws Exception {
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		HashMap<String, Object> pagingMap = new HashMap<>();
		
		currentPage = 1;
		beforeSize = 0;
		//beforeSize = pageSize * currentPage - 3; // 페이징 개수
		pageSize = pageSize * currentPage;
		
		pagingMap.put("beforeSize", beforeSize);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("gugun", URLDecoder.decode(getGugun(), "utf-8"));
		
		System.out.println(URLDecoder.decode(getGugun(), "utf-8"));
		fTotalCount = (int) sqlMapper.queryForObject("foodsSearchAreaListCount", pagingMap);
		fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsSearchAreaList", pagingMap);
		
		return SUCCESS;
	}

	public ArrayList<String> getGugunList() {
		return gugunList;
	}

	public void setGugunList(ArrayList<String> gugunList) {
		this.gugunList = gugunList;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
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

	public int getfTotalCount() {
		return fTotalCount;
	}

	public void setfTotalCount(int fTotalCount) {
		this.fTotalCount = fTotalCount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStartPage() {
		return startPage;
	}

	public void setStartPage(String startPage) {
		this.startPage = startPage;
	}

	public String getStartNum() {
		return startNum;
	}

	public void setStartNum(String startNum) {
		this.startNum = startNum;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	
	
}










