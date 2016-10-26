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

	private int c_idx;
	private int currentPage;
	
	private String c_content;
	private int b_idx;

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
		
		paramClass.setB_idx(getB_idx());

		paramClass.setC_idx(getC_idx());
 
		paramClass.setC_content(getC_content());
		paramClass.setC_regdate(today.getTime());
		
		
		//内膏飘 累己 孽府巩 荐青
		sqlMapper.insert("qboard-insertComment", paramClass);

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



	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}


	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	
	
	
	

}
