package qboard;

import com.opensymphony.xwork2.ActionSupport;

import bean.CommentBean;
//import bean.QnABoardBean;
import bean.QnABoardListBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

//import java.io.File;
import java.io.Reader;
import java.io.IOException;


public class QDeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardListBean paramClass;
	private QnABoardListBean resultClass;
	
	private CommentBean cClass = new CommentBean();
	private CommentBean cResult = new CommentBean();
	
	private int currentPage;
	//private String fileUploadPath = "D:\\upload\\";
	
	private int b_idx;	//글번호
	private int c_idx;	//댓글(코멘트)번호
	
	public QDeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	

	public String execute() throws Exception {
		paramClass = new QnABoardListBean();
		resultClass = new QnABoardListBean();
		
		resultClass = (QnABoardListBean) sqlMapper.queryForObject("qboard-selectOne", getB_idx());
		
		//File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		//deleteFile.delete();
		
		paramClass.setB_idx(getB_idx());
		
		//글 삭제 쿼리문 수행
		sqlMapper.update("qboard-deleteBoard",paramClass);
		
		return SUCCESS;
	}
	
	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String execute2() throws Exception {
		cClass = new CommentBean();
		cResult = new CommentBean();
		
		cClass.setB_idx(getB_idx());
		cClass.setC_idx(getC_idx());
		
		
		//코메트 삭제 쿼리문 시행
		sqlMapper.update("qboard-deleteComment",cClass);
		
		return SUCCESS;
	}

	public QnABoardListBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(QnABoardListBean paramClass) {
		this.paramClass = paramClass;
	}

	public QnABoardListBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(QnABoardListBean resultClass) {
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

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
}
