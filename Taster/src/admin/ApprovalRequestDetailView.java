package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
/*import java.io.File;
import java.io.FileInputStream;*/
import java.io.InputStream;
import java.io.IOException;

/*import java.net.URLEncoder;*/

import bean.RequestListBean;

public class ApprovalRequestDetailView extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RequestListBean paramClass = new RequestListBean();
	private RequestListBean resultClass = new RequestListBean();
	
	private int currentPage;
	private int r_idx;
	
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	
	public ApprovalRequestDetailView() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 상세보기
	public String execute() throws Exception {
/*		// 해당 글의 조회수 +1.
		paramClass.setR_idx(getR_idx());
		sqlMapper.update("updateReadHit", paramClass);*/
		// 해당 번호의 글을 가져온다.
		resultClass = (RequestListBean) sqlMapper.queryForObject("AprReq-selectOne", getR_idx());
		
		return SUCCESS;
	}
	
	// 첨부 파일 다운로드
	/*public String download() throws Exception {
		
		// 해당 번호의 파일 정보를 가져온다.
		resultClass = (RequestListBean) sqlMapper.queryForObject("selectOne", getR_idx());
		
		// 파일 경로와 파일명을 file 객체에 넣는다.
		File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());
		
			// 다운로드 파일 정보 설정.
		setContentLength(fileInfo.length());
		setContentDisposition("attachement;filename=" +URLEncoder.encode(resultClass.getFile_orgname(), "EUC-KR"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getFile_savname()));
		return SUCCESS;
	}*/

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
