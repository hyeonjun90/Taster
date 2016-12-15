package rboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;


import bean.RecomBoardBean;
import util.FileUploadService;
import util.TepConstants;
import util.TepUtils;

public class AdminRBoardWriteAction extends ActionSupport implements SessionAware, ServletRequestAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RecomBoardBean paramClass;
	private RecomBoardBean resultClass;
	
	private int currentPage;
	private int rec_idx;
	private Date rec_date;
	private String rec_subject;
	private String rec_content; //내용
	private String rec_image;
	/*private String file_orgName;
	private String file_savName;*/
	Calendar today = Calendar.getInstance();
	
	private Map session;
	
	private HttpServletRequest request;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Users\\USER\\git\\Taster\\Taster\\WebContent\\images\\recomList\\";
	//private String serverFullPath = "";
	//C:\Users\USER\git\Taster\Taster\WebContent\images\recomList
	
	
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
		
		//String basePath = TepConstants.UPLOAD_TEMP_PATH; //업로드 경로
		
		//FileUploadService fs = new FileUploadService(); //파일 업로드를 위한 class 파일 객체 생성
		
	/*	try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName; //업로드 파일명 생성
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName); //업로드 패스 받기
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}*/
			
			paramClass.setRec_idx(rec_idx);
			paramClass.setRec_date(today.getTime());
			paramClass.setRec_subject(getRec_subject());
			paramClass.setRec_content(getRec_content());

			//rec_image = TepUtils.getCookies(request, TepConstants.CKIMG_PATH);
			//paramClass.setRec_image(serverFullPath);
			
			sqlMapper.insert("rboard-insertRboard", paramClass);
			
			if(getUpload() != null){ 
				int rec_idx = (int)sqlMapper.queryForObject("rboard-selectLastNo");
				
				rec_image = upload(rec_idx, getUpload());
				HashMap<String, Object> map = new HashMap<>();
				map.put("rec_idx", rec_idx);
				map.put("rec_image", rec_image);
				
				sqlMapper.update("rboard-updateRboard", map);
			}
		return SUCCESS;
	}
	
	
	public String upload(int rec_idx, File upload) throws Exception {
		
		rec_image = "";
		String file_savname = "";
		String file_ext = "";
		
		System.out.println("getUploadFileName() : " + getUploadFileName());
		file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+ 1,getUploadFileName().length());
			
		file_savname = "file_" + rec_idx +"." + file_ext;
			
		File destFile = new File(fileUploadPath + file_savname);
		FileUtils.copyFile(getUpload(), destFile);
		//System.out.println("file_savname : " + file_savname);
		//rec_image = rec_image + file_savname + "|";
		
		//System.out.println("r_image : " + r_image);
		//String[] test = r_image.split("\\|"); // 특수문자로 split 할때는 특수문자 앞에 역슬래쉬(\) 2개를 붙여줘야함

		return file_savname;	
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

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
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

	public Map getSession() {
		return session;
	}

}
