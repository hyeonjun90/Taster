package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.*;
import member.*;
import common.*;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;



import common.PagingAction;

public class ReviewListAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<ReviewBean> reviewList = new ArrayList<ReviewBean>();

	private int currentPage=1;
	private int totalCount;
	private int blockCount=3;
	private int blockPage=5;
	private String pagingHtml; //페이징 구현한 HTML
	private PagingAction page; //페이징 클레스 
	
	private Map session; //member_id session값을 받아오기 위한 Map객체
	
	public void setSession(Map session){
		this.session=session;
	}
	public Map getSession(){
		return session;
	}
	
	//생성자 
	public ReviewListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String execute() throws Exception {
		
		//로그인 세션 
		if(session.get("member_id")==null){
			return LOGIN;
		}
		
		//회원의 모든 글을 가져와 reviewList에 넣는다.
		reviewList=sqlMapper.queryForList("myshop-m-selectAll", session.get("member_id")); //sql을 사용해 reviewList 배열에 값을 채운다.
		
		//pagingAction
		totalCount=reviewList.size();//전체 글의 갯수를 구한다. 
		
		//pagingAction 객체 생성
		page=new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml=page.getPagingHtml().toString();//페이지 HTML 생성 
		
		// 현재 페이지에 보여줄 마지막 글의 번호 설정 
		int lastCount=totalCount; 
		
		if(page.getEndCount()<totalCount){
			lastCount=page.getEndCount()+1;
		}
		
		//전체 리스트에서 현재 페이지 만큼의 리스트만 가져 온다.
		reviewList=reviewList.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
		
	}
	
	public List<ReviewBean> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<ReviewBean> reviewList) {
		this.reviewList = reviewList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}
	
	
}
