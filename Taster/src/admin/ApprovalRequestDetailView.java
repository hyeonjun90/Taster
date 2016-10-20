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

import bean.RequestListBean;
import bean.ShopBean;

public class ApprovalRequestDetailView extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RequestListBean paramClass = new RequestListBean();
	private RequestListBean resultClass = new RequestListBean();
	private ShopBean approvedClass = new ShopBean();

	
	private int currentPage;
	private int r_idx;
	
	private String fileUploadPath = "C:\\Program Files\\Java\\upload\\";
	
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	
	public ApprovalRequestDetailView() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// �󼼺���
	public String execute() throws Exception {

		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		
		return SUCCESS;
	}
	
	// ÷�� ���� �ٿ�ε�
	public String download() throws Exception {
		
		// �ش� ��ȣ�� ���� ������ �����´�.
		resultClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		
		// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
		File fileInfo = new File(fileUploadPath + resultClass.getR_shop_file_savname());
		
			// �ٿ�ε� ���� ���� ����.
		setContentLength(fileInfo.length());
		setContentDiposition("attachement;filename=" +URLEncoder.encode(resultClass.getR_shop_file_orgname(), "EUC-KR"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getR_shop_file_savname()));
		return SUCCESS;
	}

	//�űԽĴ��� ��û �� ����
	public String approvalActionOk() throws Exception {
		
		approvedClass.setShop_idx(resultClass.getR_idx());
		System.out.println(resultClass.getR_idx());
		approvedClass.setShop_name(resultClass.getR_shop_name());
		System.out.print(resultClass.getR_shop_name());
		approvedClass.setShop_tel(resultClass.getR_shop_tel());
		approvedClass.setShop_kind(resultClass.getR_shop_kind());
		approvedClass.setShop_addr1(resultClass.getR_shop_addr1());
		approvedClass.setShop_addr2(resultClass.getR_shop_addr2());
		approvedClass.setShop_addr2(resultClass.getR_shop_addr3());
		approvedClass.setShop_addr4(resultClass.getR_shop_addr4());
		approvedClass.setShop_price(resultClass.getR_shop_price());
		approvedClass.setShop_holiday(resultClass.getR_shop_holiday());
		approvedClass.setShop_new(1);
	/*	approvedClass.setShop_file_orgname(resultClass.getR_shop_file_orgname());
		approvedClass.setShop_file_savname(resultClass.getR_shop_file_savname());
		*/
		sqlMapper.insert("Shop-insertAshop", approvedClass);

			return SUCCESS;
			
		} 
	
	//�űԽĴ��� ��û �� ���ΰź�
	public String approvalActionNok() throws Exception {
		

		resultClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());

		/*//���� ���� ����
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();*/

		// ������ �׸� ����.
		paramClass.setR_idx(getR_idx());
				
		// ���� ���� ����.
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

	public RequestListBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RequestListBean ressultClass) {
		this.resultClass = ressultClass;
	}

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

	public InputStream getInputStream() {
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
	}
	
	
}
