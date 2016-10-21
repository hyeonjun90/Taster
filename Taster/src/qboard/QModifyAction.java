package qboard;

import com.opensymphony.xwork2.ActionSupport;

import bean.QnABoardBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

//import java.io.File;
//import org.apache.commons.io.FileUtils;

public class QModifyAction extends ActionSupport{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardBean paramClass;
	private QnABoardBean resultClass;
	
	private int currentPage;
	
	private int b_idx;
	private String b_title;
	private String member_id;
	//private String b_pwd;	//로그인중인 ID와 동일한가 여부로 글을 수정하게 할것임.
	private String b_content;
	//private String old_file;
	
	//private File upload;
	//private String uploadContentType;
	//private String uploadFileName;
	//private String fileUploadPath = "D:\\upload\\";
	
	public QModifyAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	public String execute() throws Exception
	{
		paramClass = new QnABoardBean();
		resultClass = new QnABoardBean();
		
		paramClass.setB_idx(getB_idx());
		paramClass.setB_title(getB_title());
		paramClass.setMember_id(getMember_id());
		//paramClass.setB_pwd(getB_pwd());
		paramClass.setB_content(getB_content());
		sqlMapper.update("qboard-updateBoard", paramClass);

		/*
		if(getUpload() != null)
		{
			String file_name = "file_" + getNo();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') +1, getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);
			
			sqlMapper.update("updateFile", paramClass);		
		}
		*/
		
		resultClass = (QnABoardBean) sqlMapper.queryForObject("qboard-selectOne", getB_idx());
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
	
	
	
	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	
	
	/*
	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	*/
	
	
	
	
	/*
	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String oldFile) {
		old_file = oldFile;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	
	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
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
