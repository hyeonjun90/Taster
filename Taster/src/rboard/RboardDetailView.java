package rboard;

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

import bean.RecomBoardBean;

public class RboardDetailView extends ActionSupport {
	

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RecomBoardBean paramClass = new RecomBoardBean();
	private RecomBoardBean resultClass = new RecomBoardBean();
	
	private int currentPage;
	private int rec_idx;
	
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	
	public RboardDetailView() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// �󼼺���
	public String execute() throws Exception {
/*		// �ش� ���� ��ȸ�� +1.
		paramClass.setR_idx(getR_idx());
		sqlMapper.update("updateReadHit", paramClass);*/
		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (RecomBoardBean) sqlMapper.queryForObject("rboard-selectOne", getRec_idx());
		
		return SUCCESS;
	}
	
	// ÷�� ���� �ٿ�ε�
	/*public String download() throws Exception {
		
		// �ش� ��ȣ�� ���� ������ �����´�.
		resultClass = (RequestListBean) sqlMapper.queryForObject("selectOne", getR_idx());
		
		// ���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
		File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());
		
			// �ٿ�ε� ���� ���� ����.
		setContentLength(fileInfo.length());
		setContentDisposition("attachement;filename=" +URLEncoder.encode(resultClass.getFile_orgname(), "EUC-KR"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getFile_savname()));
		return SUCCESS;
	}*/

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		RboardDetailView.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RboardDetailView.sqlMapper = sqlMapper;
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
