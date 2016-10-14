package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import bean.*;
import member.*;
import common.*;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import common.PagingAction;

public class ReviewListAction extends ActionSupport {
	
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private List<ReviewBean> reviewList = new ArrayList<ReviewBean>(); 
	
	private int currentPage=1;
	private int totalCount;
	private int blockCount=3;
	private int blockPage=5;
	private String pagingHtml; //����¡ ������ HTML
	private PagingAction page; //����¡ Ŭ���� 
	private int num=0;
	
	public ReviewListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String execute() throws Exception {
		
		reviewList=sqlMapper.queryForList("myshop-m-selectAll"); //sql�� ����� reviewList �迭�� ���� ä���.
		
		totalCount=reviewList.size();
		
		
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
