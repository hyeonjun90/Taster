package qboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.net.*;
//import bean.QnABoardBean;
import bean.*;


public class QBoardListAction extends ActionSupport{

   public static Reader reader;
   public static SqlMapClient sqlMapper;

   
   private List<QnABoardListBean> list = new ArrayList<QnABoardListBean>();
   
   
   private String searchKeyword=null;	//검색키워드
   private int searchNum;				//검색속성필터값
   


	private int currentPage = 1;	//현제 페이지
	private int totalCount;			//
	private int blockCount = 10;	//한 페이지 게시글 수 제한
	private int blockPage = 5;		//<이전  다음> 가운데에 표시되는 페이지 수
	private String pagingHtml;
	private QPagingAction page;		
	private int num = 0;			


	public QBoardListAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();		
		
	}
	
	public String execute() throws Exception {
		
		//null값이 아니면 search메소드 실행하고 null값이면 문의게시판 리스트 출력(액션명 qboardList)
		if(getSearchKeyword() != null)
		{
			return search();
		}
		
		// 차근차근 살펴볼것
		
		list = sqlMapper.queryForList("qboard-selectAll");
		
		totalCount = list.size();
		page = new QPagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}
	
	public String search() throws Exception {
		
		searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;

		//qboard_view.jsp의 searchNum값 참조. 0은 닉네임검색시, 1은 글제목 검색시 , 2는 글내용 검색시 searchNum값.
		if(searchNum == 0){
			list = sqlMapper.queryForList("qboard-selectSearchN", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1){
			list = sqlMapper.queryForList("qboard-selectSearchT", "%"+getSearchKeyword()+"%");
		}
		
		if(searchNum == 2){
			list = sqlMapper.queryForList("qboard-selectSearchC", "%"+getSearchKeyword()+"%");	
		}
		
		
		totalCount = list.size();
		page = new QPagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}




   public List<QnABoardListBean> getList() {
      return list;
   }

   public void setList(List<QnABoardListBean> list) {
      this.list = list;
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
   
   
   
   public String getSearchKeyword() {
      return searchKeyword;
   }
   
   public void setSearchKeyword(String searchKeyword) {
      this.searchKeyword = searchKeyword;
   }

   public int getSearchNum() {
      return searchNum;
   }

   public void setSearchNum(int searchNum) {
      this.searchNum = searchNum;
   }
   
   

}