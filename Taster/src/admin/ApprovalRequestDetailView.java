package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import bean.RequestListBean;
import bean.ShopBean;

public class ApprovalRequestDetailView extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	HashMap<String, Object> map = new HashMap<>();
	
	private RequestListBean paramClass = new RequestListBean();  //requestListBean 파라미터 저장  
/*	private RequestListBean resultClass = new RequestListBean(); //입력된 요청글을 불러오는 테이블
*/	private ShopBean shopBean = new ShopBean(); //승인된 요청글을 넣을 테이블
	
	private int currentPage;

	int shop_idx;
	
	private String file_savname;
	
	public String getFile_savname() {
		return file_savname;
	}

	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}


	
	private int r_idx;
	private String r_shop_file_orgname; //파일원본이름
	private String r_shop_file_savname; //파일저장명
	
	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	
	private String fileUploadPath="C:\\git\\Taster\\Taster\\WebContent\\images\\shop\\";

	
/*	private String fileUploadPath = "C:\\Program Files\\Java\\upload\\";
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	*/
	
	//생성자
	public ApprovalRequestDetailView() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception {    
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		return SUCCESS;
	}


	//신규식당등록 요청 글 승인
	public String approvalActionOk() throws Exception {

		//요청된 글의 내용을 가져온다
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		
		//해당 글의 값을 빈에 넣는다 
		shopBean.setShop_idx(paramClass.getR_idx());
		System.out.println(paramClass.getR_idx());
		
		shopBean.setShop_name(paramClass.getR_shop_name());
		System.out.print(paramClass.getR_shop_name());
		
		shopBean.setShop_tel(paramClass.getR_shop_tel());
		shopBean.setShop_kind(paramClass.getR_shop_kind());
		shopBean.setShop_addr1(paramClass.getR_shop_addr1());
		shopBean.setShop_addr2(paramClass.getR_shop_addr2());
		shopBean.setShop_addr2(paramClass.getR_shop_addr3());
		shopBean.setShop_addr4(paramClass.getR_shop_addr4());
		shopBean.setShop_price(paramClass.getR_shop_price());
		shopBean.setShop_holiday(paramClass.getR_shop_holiday());
		
		shopBean.setFile_orgname(paramClass.getR_shop_file_orgname());
		shopBean.setFile_savname(paramClass.getR_shop_file_savname());
		
		//shopBean 객체에 입력된 requestList값을  SHOP 테이블 DB에 저장
		sqlMapper.insert("Shop-insertAshop", shopBean);
		
		shop_idx = (int) sqlMapper.queryForObject("Shop-getIdx");    //저장된후 shop테이블의 마지막 인덱스 값을 불러 온다(방금 저장된 것)
		

		//실제 서버에 저장될 파일 이름과 확장자 설정 
		String file_name = "file_" + shop_idx;
		
		//확장자 설정 
		String file_ext = getUploadFileName().substring(
				getUploadFileName().lastIndexOf('.')+ 1,
				getUploadFileName().length());
		
		file_savname = "file_" + shop_idx + "." + file_ext;

		map.put("shop_idx", shop_idx);
		map.put("file_savname", file_savname);
		
		sqlMapper.update("Shop_update_file_savname", map);
		
		//File destFile = new File(fileUploadPath + file_name);
		System.out.println("paramClass.getR_idx() : " + paramClass.getR_idx());
		
		File beforeFile = new File("C:\\git\\Taster\\Taster\\WebContent\\images\\temporary_shop\\" + "file_" + paramClass.getR_idx());
		
		System.out.println("beforeFile.exists() : " + beforeFile.exists());
		
		File afterFile = new File("C:\\git\\Taster\\Taster\\WebContent\\images\\shop\\" + "file_" + shop_idx);
		
		
		
		//승인된 요청글을 RequestListBean DB에서 삭제
		sqlMapper.update("AprReq-DeleteReqList", paramClass);
			return SUCCESS;	
		} 
	
	//신규식당등록 요청 글 승인거부
	public String approvalActionNok() throws Exception {
		
		//요청된 글의 내용을 가져온다
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());

		/*//서버 파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();*/

		// 삭제할 요청글을 paramClass에 저장
		paramClass.setR_idx(getR_idx());
				
		// 요청글을 RequestListBean DB에서 삭제
		sqlMapper.update("AprReq-DeleteReqList", paramClass);

		return SUCCESS;
	} 
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ApprovalRequestDetailView.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ApprovalRequestDetailView.sqlMapper = sqlMapper;
	}

	public RequestListBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RequestListBean paramClass) {
		this.paramClass = paramClass;
	}

	/*public RequestListBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RequestListBean ressultClass) {
		this.resultClass = ressultClass;
	}*/

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	/*public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDiposition() {
		return contentDiposition;
	}

	public void setContentDiposition(String contentDiposition) {
		this.contentDiposition = contentDiposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}*/
	
	public String getR_shop_file_orgname() {
		return r_shop_file_orgname;
	}

	public void setR_shop_file_orgname(String r_shop_file_orgname) {
		this.r_shop_file_orgname = r_shop_file_orgname;
	}

	public String getR_shop_file_savname() {
		return r_shop_file_savname;
	}

	public void setR_shop_file_savname(String r_shop_file_savname) {
		this.r_shop_file_savname = r_shop_file_savname;
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
	
	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	
}
