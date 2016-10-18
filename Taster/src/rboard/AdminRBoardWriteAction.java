package rboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

import bean.RecomBoardBean;

public class AdminRBoardWriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RecomBoardBean paramClass;
	private RecomBoardBean resultClass;
	
	private int currentPage;
	private int rec_idx;
	private Date rec_date;
	private String rec_subject;
	private String rec_content; //³»¿ë
	private String rec_image;
	/*private String file_orgName;
	private String file_savName;*/
	Calendar today = Calendar.getInstance();
	
	/*private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "";*/
	
	public AdminRBoardWriteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		paramClass = new RecomBoardBean();
		resultClass = new RecomBoardBean();
		
		paramClass.setRec_idx(getRec_idx());
		paramClass.setRec_date(today.getTime());
		paramClass.setRec_subject(getRec_subject());
		paramClass.setRec_content(getRec_content());
		paramClass.setRec_image(getRec_image());
		
		sqlMapper.insert("rboard-insertRboard", paramClass);
		
/*		if(getUpload() != null) {
			resultClass = (RecomBoardBean) sqlMapper.queryForObject("selectLastNo");
		
			String file_name = "file_" + resultClass.getRec_idx();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setRec_idx(resultClass.getRec_idx());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name+"."+file_ext);
			
			sqlMapper.update("updateFile", paramClass);
		}*/
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminRBoardWriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminRBoardWriteAction.sqlMapper = sqlMapper;
	}

	public RecomBoardBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RecomBoardBean paramClass) {
		this.paramClass = paramClass;
	}

	public RecomBoardBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RecomBoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRec_idx() {
		return rec_idx;
	}

	public void setRec_idx(int rec_idx) {
		this.rec_idx = rec_idx;
	}

	public Date getRec_date() {
		return rec_date;
	}

	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}

	public String getRec_subject() {
		return rec_subject;
	}

	public void setRec_subject(String rec_subject) {
		this.rec_subject = rec_subject;
	}
	
	public String getRec_content() {
		return rec_content;
	}

	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}

	public String getRec_image() {
		return rec_image;
	}

	public void setRec_image(String rec_image) {
		this.rec_image = rec_image;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

}
