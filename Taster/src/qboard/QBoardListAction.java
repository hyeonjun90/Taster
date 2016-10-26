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
   
   
   private String searchKeyword=null;
   private int searchNum;
   


	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
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
		System.out.println("리스트액션 excute메소드용 테스트 숫자 몇나오니?");
		System.out.println(getSearchKeyword());
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
		System.out.println("리스트액션 써치메소드 값 테스트 숫자 몇나오니?");
		System.out.println(searchKeyword);
		System.out.println(searchNum);
		System.out.println("리스트액션 써치메소드 값 테스트 끝");
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