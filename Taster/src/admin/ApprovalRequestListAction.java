package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import common.PagingAction;
import bean.RequestListBean;


public class ApprovalRequestListAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<RequestListBean> list = new ArrayList<RequestListBean>();
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	
	public ApprovalRequestListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		list = sqlMapper.queryForList("AprReq-selectAll");
		
		totalCount = list.size();
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
		
	}
	
/*	public void checkedApproval(Map resultMap) throws Exception {
		
		String delUser = resultMap.get(Management.DEL_USER).toString();
		System.out.println("Service==delUser>>"+delUser);
		
		String[] userArr = delUser.split("-");  // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
				
		if (userArr != null && userArr.length>0) {
			for (int i = 0; i < userArr.length; i++) {
				requestMap.put(Parameter.USER_ID, userArr[i]);
				System.out.println("======"+i+"번째 userid ==" +requestMap.get(Parameter.USER_ID));
				manageDao.userDel(requestMap);
			}
		}
	}*/

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ApprovalRequestListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ApprovalRequestListAction.sqlMapper = sqlMapper;
	}

	public List<RequestListBean> getList() {
		return list;
	}

	public void setList(List<RequestListBean> list) {
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

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}
	
	

}
