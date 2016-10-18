package qboard;

import com.opensymphony.xwork2.ActionSupport;

import bean.CommentBean;
import bean.QnABoardBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

//import java.io.File;
import java.io.Reader;
import java.io.IOException;


public class QDeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardBean paramClass;
	private QnABoardBean resultClass;
	
	private CommentBean cClass = new CommentBean();
	private CommentBean cResult = new CommentBean();
	
	private int currentPage;
	//private String fileUploadPath = "D:\\upload\\";
	
	private int b_idx;
	
	public QDeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new QnABoardBean();
		resultClass = new QnABoardBean();
		
		resultClass = (QnABoardBean) sqlMapper.queryForObject("selectOne", getB_idx());
		
		//File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		//deleteFile.delete();
		
		paramClass.setB_idx(getB_idx());
		
		sqlMapper.update("deleteBoard",paramClass);
		
		return SUCCESS;
	}
	
	public String execute2() throws Exception {
		cClass = new CommentBean();
		cResult = new CommentBean();
		
		cClass.setB_idx(getB_idx());
		
		sqlMapper.update("deleteComment",cClass);
		
		return SUCCESS;
	}

	public QnABoardBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(QnABoardBean paramClass) {
		this.paramClass = paramClass;
	}

	public QnABoardBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(QnABoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	/*
	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	 */
	
	public int getB_idx() {
		return b_idx;
	}

	public void setNo(int b_idx) {
		this.b_idx = b_idx;
	}
}
