package foods;

import java.io.File;
import java.io.Reader;
import java.io.IOException;
import java.util.HashMap;

import java.util.*;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


import bean.ReviewBean;


public class FoodsCommentWriteAction extends ActionSupport implements SessionAware { // 식당에 댓글 작성 액션.
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper;
	
	private ReviewBean RBean = new ReviewBean(); 

	private int review_idx;
	private int currentPage;

	private String r_title;
	private String r_content;
	private int r_score;
	private int r_pungga;
	private String r_image;
	private Date r_regdate;
	private String member_id;
	private int shop_idx;
	
	private String r_upload1, r_upload2, r_upload3;
	
	private String file_savName;
	
	private int org_review_idx; //리뷰 수정시 사용

	/*private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";*/

	private File[] uploads;
	private String[] uploadsFileName;
	private String[] uploadsContentType;
	private String fileUploadPath = "C:\\Java\\git\\Taster\\WebContent\\images\\review\\";
	
	Calendar today = Calendar.getInstance();
	
	private Map session; //id값 받아오기


	public FoodsCommentWriteAction() throws IOException
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
		
		//RBean = new ReviewBean(); 
		member_id = getMember_id();
		
		RBean.setReview_idx(review_idx);
		RBean.setR_title(getR_title());
		RBean.setR_content(getR_content());
		RBean.setR_score(getR_score());
		RBean.setR_pungga(getR_pungga());
		RBean.setShop_idx(getShop_idx());
		RBean.setMember_id(member_id);
		
		//입력되지 않은 파일창은 공백으로 채움 
		
		sqlMapper.insert("insertReview", RBean);
		
		int review_idx = (int)sqlMapper.queryForObject("getReviewSeq");
		System.out.println("review_idx : " + review_idx);
		
		if(getUploads() != null) {
			HashMap<String, Object> map = new HashMap<>();
			
			String r_image = upload(review_idx, getUploads());
			map.put("review_idx", review_idx);
			map.put("r_image", r_image);
			
			sqlMapper.update("r_image_update", map);
		}
		return SUCCESS;
	}
		

	public String upload(int review_idx, File[] uploads) throws Exception {
		
		r_image = "";
		String file_savname = "";
		String file_ext = "";
		for(int i=0; i<uploads.length; i++) {
			file_ext = getUploadsFileName()[i].substring(
					getUploadsFileName()[i].lastIndexOf('.')+ 1,
					getUploadsFileName()[i].length());
			
			file_savname = "file_" + review_idx +"_" + i + "." + file_ext;
			
			File destFile = new File(fileUploadPath + file_savname);
			FileUtils.copyFile(getUploads()[i], destFile);
			//System.out.println("file_savname : " + file_savname);
			r_image = r_image + file_savname + "|";
		}
		//System.out.println("r_image : " + r_image);
		//String[] test = r_image.split("\\|"); // 특수문자로 split 할때는 특수문자 앞에 역슬래쉬(\) 2개를 붙여줘야함

		return r_image;	
	}
	
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	public Map getSession() {
		return session;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		FoodsCommentWriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		FoodsCommentWriteAction.sqlMapper = sqlMapper;
	}


	public ReviewBean getRBean() {
		return RBean;
	}

	public void setRBean(ReviewBean rBean) {
		RBean = rBean;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public int getR_pungga() {
		return r_pungga;
	}

	public void setR_pungga(int r_pungga) {
		this.r_pungga = r_pungga;
	}

	public String getR_image() {
		return r_image;
	}

	public void setR_image(String r_image) {
		this.r_image = r_image;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public int getOrg_review_idx() {
		return org_review_idx;
	}

	public void setOrg_review_idx(int org_review_idx) {
		this.org_review_idx = org_review_idx;
	}

	

	public File[] getUploads() {
		return uploads;
	}

	public void setUploads(File[] uploads) {
		this.uploads = uploads;
	}

	public String[] getUploadsFileName() {
		return uploadsFileName;
	}

	public void setUploadsFileName(String[] uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}

	public String[] getUploadsContentType() {
		return uploadsContentType;
	}

	public void setUploadsContentType(String[] uploadsContentType) {
		this.uploadsContentType = uploadsContentType;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public String getR_upload1() {
		return r_upload1;
	}

	public void setR_upload1(String r_upload1) {
		this.r_upload1 = r_upload1;
	}

	public String getR_upload2() {
		return r_upload2;
	}

	public void setR_upload2(String r_upload2) {
		this.r_upload2 = r_upload2;
	}

	public String getR_upload3() {
		return r_upload3;
	}

	public void setR_upload3(String r_upload3) {
		this.r_upload3 = r_upload3;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
	}
	
	

	
	
	
}
