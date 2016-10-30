package rboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.ArrayList;
/*import java.io.File;
import java.io.FileInputStream;*/
import java.io.InputStream;
import java.io.IOException;

import bean.FoodsDetailBean;

/*import java.net.URLEncoder;*/

import bean.RecomBoardBean;

public class AdminRBoardViewAction extends ActionSupport {
	

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RecomBoardBean RCBean = new RecomBoardBean();
	//private ArrayList<RecomBoardBean> RecomList = new ArrayList<RecomBoardBean>(); //리뷰(코멘트) 리스트
	
	//private RecomBoardBean resultClass = new RecomBoardBean();
	
	private int currentPage;
	private int rec_idx;
	
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	
	public AdminRBoardViewAction() throws IOException {
		
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
		RCBean = (RecomBoardBean) sqlMapper.queryForObject("rboard-selectOne", getRec_idx());
		//RecomList = (ArrayList<RecomBoardBean>)sqlMapper.queryForList("recommandList", getRec_idx());
		
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
		AdminRBoardViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminRBoardViewAction.sqlMapper = sqlMapper;
	}

	
	/*public ArrayList<RecomBoardBean> getRecomList() {
		return RecomList;
	}

	public void setRecomList(ArrayList<RecomBoardBean> recomList) {
		RecomList = recomList;
	}*/

	public RecomBoardBean getRCBean() {
		return RCBean;
	}
	

	public void setRCBean(RecomBoardBean rCBean) {
		RCBean = rCBean;
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
