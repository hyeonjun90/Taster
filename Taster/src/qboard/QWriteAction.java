package qboard;

import com.opensymphony.xwork2.ActionSupport;

import bean.QnABoardBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

//import java.io.File;
//import org.apache.commons.io.FileUtils;


public class QWriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardBean paramClass;
	private QnABoardBean resultClass;

	
	private int currentPage;
	
	private int b_idx;
	private String b_title;
	private String member_id;
	private String b_pwd;
	private String b_content;
	//private String file_orgName;
	//private String file_savName;
	Calendar today = Calendar.getInstance();
	
	//private File upload;
	private String uploadB_contentType;
	//private String uploadFileName;
	//private String fileUploadPath="C:\\Java\\Framework03\\upload\\";
	
	
	//private int ref;
	//private int re_step;
	//private int re_level;
	

	//boolean reply = false;
	
	public QWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}
	
	/*
	public String reply() throws Exception
	{
		reply=true;
		resultClass = new QnABoardBean();
		
		resultClass = (QnABoardBean) sqlMapper.queryForObject("selectOne", getB_idx());
		resultClass.setB_title("[답변] " + resultClass.getB_title());
		resultClass.setB_pwd("");
		resultClass.setName("");
		resultClass.setB_content("");
		//resultClass.setFile_orgname(null);
		//resultClass.setFile_savname(null);
		
		
		return SUCCESS;
		
	}
	*/

	public String execute() throws Exception {
		
		paramClass = new QnABoardBean();
		resultClass = new QnABoardBean();
		
		/*답변관련
		
		if(ref == 0)
		{
			paramClass.setRe_step(0);
			paramClass.setRe_level(0);
			
			
			
		}
		else
		{
			
			paramClass.setRef(getRef());
			paramClass.setRe_step(getRe_step());
			sqlMapper.update("updateReplyStep", paramClass);
			
			paramClass.setRe_step(getRe_step() + 1);
			paramClass.setRe_level(getRe_level() + 1);
			paramClass.setRef(getRef());
		}
		*/
		//System.out.println(getMember_id());
		paramClass.setB_title(getB_title());
		paramClass.setMember_id(getMember_id());
		paramClass.setB_pwd(getB_pwd());
		paramClass.setB_content(getB_content());
		paramClass.setB_regdate(today.getTime());
		
		
		//등록쿼리 수행
		sqlMapper.insert("qboard-insertBoard", paramClass);
		
		/*
		if(ref == 0)
			sqlMapper.insert("insertBoard", paramClass);
			
		else
			sqlMapper.insert("insertBoardReply", paramClass);
		*/
			
		
		/* 파일업로드 관련
		if(getUpload() != null)
		{
			resultClass = (QnABoardBean) sqlMapper.queryForObject("selectLastB_idx");
			
			String file_name = "file_" + resultClass.getB_idx();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length()
					);
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setB_idx(resultClass.getB_idx());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." +file_ext);
			
			sqlMapper.update("updateFile", paramClass);
		}
		*/

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

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}
	
	public String getUploadContentType() {
		return uploadB_contentType;
	}

	public void setUploadB_contentType(String uploadB_contentType) {
		this.uploadB_contentType = uploadB_contentType;
	}
	
	

	/*답변관련
	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}
	
	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int reStep) {
		re_step = reStep;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int reLevel) {
		re_level = reLevel;
	}	
	*/
	
	/*
	public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String fileOrgName) {
		file_orgName = fileOrgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String fileSavName) {
		file_savName = fileSavName;
	}
	
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
	
	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	
	*/
	
	
	

}
