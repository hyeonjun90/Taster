package qboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;

import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import bean.CommentBean;
import bean.QnABoardBean;
//다운로드 메서드 삭제

public class QBoardViewAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardBean paramClass = new QnABoardBean();
	private QnABoardBean resultClass = new QnABoardBean();
	private List<CommentBean> commentlist = new ArrayList<CommentBean>();
	
	private CommentBean cClass = new CommentBean();
	private CommentBean cResult = new CommentBean();
	
	
	private int currentPage;
	
	private int b_idx;
	
	private String b_pwd;
	
	//private String fileUploadPath = "C:\\Java\\Framework02\\upload\\";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	public QBoardViewAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setB_idx(getB_idx());
		sqlMapper.update("qboard-updateB_readCount",paramClass);
		
		resultClass = (QnABoardBean) sqlMapper.queryForObject("qboard-selectOne", getB_idx());
		
		commentlist = sqlMapper.queryForList("qboard-commentSelectAll", getB_idx());
		
		return SUCCESS;
	}
	
	
	
	public String checkForm() throws Exception
	{
		return SUCCESS;
	}
	
	public String checkAction()	throws Exception
	{
		paramClass.setB_idx(getB_idx());
		paramClass.setB_pwd(getB_pwd());
		
		resultClass = (QnABoardBean) sqlMapper.queryForObject("selectB_pwd", paramClass);
		
		if(resultClass == null)
			return ERROR;
		
		return SUCCESS;
	}
	
	public String checkAction2()	throws Exception
	{
		cClass.setB_idx(getB_idx());
		//cClass.setB_pwd(getB_pwd());
		
		cResult = (CommentBean) sqlMapper.queryForObject("selectB_pwd2", cClass);
		
		if(cResult == null)
			return ERROR;
		
		return SUCCESS;
	}

	public List<CommentBean> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<CommentBean> commentlist) {
		this.commentlist = commentlist;
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

	public CommentBean getcClass() {
		return cClass;
	}

	public void setcClass(CommentBean cClass) {
		this.cClass = cClass;
	}

	public CommentBean getcResult() {
		return cResult;
	}

	public void setcResult(CommentBean cResult) {
		this.cResult = cResult;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	
	
	

	
	
	public String getB_pwd() {
		return b_pwd;
	}
	
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	 
	/*
	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}*/
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	
	

}
