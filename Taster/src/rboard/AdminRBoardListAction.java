package rboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import common.PagingAction;
import common.SearchPagingAction;
import bean.RecomBoardBean;

public class AdminRBoardListAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<RecomBoardBean> list = new ArrayList<RecomBoardBean>();
	
	private String searchKeyword;
	private int searchNum;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private SearchPagingAction Searchpage;
	
	public AdminRBoardListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		
		if(getSearchKeyword() != null)
		{
			return search();
		}
		
		list = sqlMapper.queryForList("rboard-selectAll");
		
		totalCount = list.size();
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public String search() throws Exception {
		
		System.out.println(getSearchKeyword());
		System.out.println(searchNum);
		if (searchNum == 0) {
			list = sqlMapper.queryForList("rboard-selectSearchS", "%"+getSearchKeyword()+"%");
		}
		if ( searchNum == 1) {
			list = sqlMapper.queryForList("rboard-selectSearchC", "%"+getSearchKeyword()+"%");
		}
		
		totalCount = list.size();
		Searchpage = new SearchPagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = Searchpage.getPagingHtml().toString();
		
        int lastCount = totalCount;
		
		if(Searchpage.getEndCount() < totalCount)
			lastCount = Searchpage.getEndCount() + 1;
		
		list = list.subList(Searchpage.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminRBoardListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminRBoardListAction.sqlMapper = sqlMapper;
	}

	public List<RecomBoardBean> getList() {
		return list;
	}

	public void setList(List<RecomBoardBean> list) {
		this.list = list;
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

	public SearchPagingAction getSearchpage() {
		return Searchpage;
	}

	public void setSearchpage(SearchPagingAction searchpage) {
		Searchpage = searchpage;
	}
	

}
