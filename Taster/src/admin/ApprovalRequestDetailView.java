package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.List;

import bean.RequestListBean;
import bean.ShopBean;

public class ApprovalRequestDetailView extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	HashMap<String, Object> map = new HashMap<>();
	
	private RequestListBean paramClass = new RequestListBean();  //requestListBean �Ķ���� ����  
/*	private RequestListBean resultClass = new RequestListBean(); //�Էµ� ��û���� �ҷ����� ���̺�
*/	private ShopBean shopBean = new ShopBean(); //���ε� ��û���� ���� ���̺�
	
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
	private String r_shop_file_orgname; //���Ͽ����̸�
	private String r_shop_file_savname; //���������
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	
	private String fileUploadPath="C:\\Java\\git\\Taster\\WebContent\\images\\shop\\";

	
/*	private String fileUploadPath = "C:\\Program Files\\Java\\upload\\";
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	*/
	
	//������
	public ApprovalRequestDetailView() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception {    
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		return SUCCESS;
	}


	//�űԽĴ��� ��û �� ����
	public String approvalActionOk() throws Exception {

		//��û�� ���� ������ �����´�
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		
		//�ش� ���� ���� �� �ִ´� 
		shopBean.setShop_idx(paramClass.getR_idx());
		shopBean.setShop_name(paramClass.getR_shop_name());
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
		System.out.println("getR_shop_file_savname : " + paramClass.getR_shop_file_savname());
		//shopBean ��ü�� �Էµ� requestList����  SHOP ���̺� DB�� ����
		sqlMapper.insert("Shop-insertAshop", shopBean);
		
		shop_idx = (int) sqlMapper.queryForObject("Shop-getIdx");    //������� shop���̺��� ������ �ε��� ���� �ҷ� �´�(��� ����� ��)
		System.out.println("shop_idx : " + shop_idx);
		map.put("shop_idx", shop_idx);    
		
		file_savname = (String) sqlMapper.queryForObject("Shop-select-filesavName", map);
		
		System.out.println("file_savname : " + file_savname);
		//Ȯ���� ������ 
		int pos = file_savname.lastIndexOf(".");
		System.out.println("pos : " + pos);
		String file_ext = file_savname.substring(pos+1);
		System.out.println("file_ext : " + file_ext);
		
		file_savname = "file_" + shop_idx + "." + file_ext;
		System.out.println("file_savname : " + file_savname);
		map.put("file_savname", file_savname);
		
		sqlMapper.update("Shop_update_file_savname", map);
		
		File beforeFile = new File("C:\\Java\\git\\Taster\\WebContent\\images\\temporary_shop\\" + "file_" + paramClass.getR_idx() + "." + file_ext);
		File afterFile = new File("C:\\Java\\git\\Taster\\WebContent\\images\\shop\\" + file_savname);
		
		beforeFile.renameTo(afterFile);
		
		//moveFile(beforeFile.getAbsolutePath(), afterFile.getAbsolutePath());

		//���ε� ��û���� RequestListBean DB���� ����
		sqlMapper.update("AprReq-DeleteReqList", paramClass);
		return SUCCESS;	
	
		//System.out.println("paramClass.getR_idx() : " + paramClass.getR_idx());
		} 
	
	//���� shop���� �ű��
	public boolean moveFile(String source, String dest){
		boolean result = false;
		
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		
		try{
			inputStream = new FileInputStream(source);
			outputStream = new FileOutputStream(dest);
		}catch(FileNotFoundException e){
			e.printStackTrace();
			result = false;
		}
		
		FileChannel fcin = inputStream.getChannel();
		FileChannel fcout = outputStream.getChannel();
		
		long size = 0;
		try{
			size = fcin.size();
			fcin.transferTo(0, size, fcout);
			
			fcout.close();
			fcin.close();
			outputStream.close();
			inputStream.close();
			
			result = true;	
		}catch(IOException e){
			e.printStackTrace();
			result = false;
		}
		
		File f = new File(source);
		if(f.delete()){
			result = true;
		}
		return result;
	}
	
	//�űԽĴ��� ��û �� ���ΰź�
	public String approvalActionNok() throws Exception {
		
		//��û�� ���� ������ �����´�
		paramClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());

		/*//���� ���� ����
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();*/

		// ������ ��û���� paramClass�� ����
		paramClass.setR_idx(getR_idx());
				
		// ��û���� RequestListBean DB���� ����
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
