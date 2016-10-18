package qboard;


import com.opensymphony.xwork2.ActionSupport;

import bean.CommentBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;


public class AdminCommentAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBean paramClass;
	private CommentBean resultClass;

	private int C_IDX;
	private int currentPage;
	
	private String C_CONTENT;
	private int B_IDX;

	Calendar today = Calendar.getInstance();

	public AdminCommentAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}

	public String execute() throws Exception {
		
		paramClass = new CommentBean();
		resultClass = new CommentBean();
		
		paramClass.setB_idx(getB_IDX());

		paramClass.setC_idx(getC_IDX());
		System.out.print(getC_CONTENT()); 
		paramClass.setC_content(getC_CONTENT());
		paramClass.setC_regdate(today.getTime());
		
		sqlMapper.insert("insertComment", paramClass);
		

		return SUCCESS;
	}

	public CommentBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(CommentBean paramClass) {
		this.paramClass = paramClass;
	}

	public CommentBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(CommentBean resultClass) {
		this.resultClass = resultClass;
	}



	public int getC_IDX() {
		return C_IDX;
	}

	public void setC_IDX(int C_IDX) {
		this.C_IDX = C_IDX;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public String getC_CONTENT() {
		return C_CONTENT;
	}

	public void setC_CONTENT(String C_CONTENT) {
		this.C_CONTENT = C_CONTENT;
	}


	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public int getB_IDX() {
		return B_IDX;
	}

	public void setB_IDX(int B_IDX) {
		this.B_IDX = B_IDX;
	}

	
	
	
	

}
