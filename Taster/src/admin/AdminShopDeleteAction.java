package admin;

import com.opensymphony.xwork2.ActionSupport;

import bean.ShopBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class AdminShopDeleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ShopBean paramClass;
	private ShopBean resultClass;
	
	private int currentPage;
	
	private String fileUploadPath ="C:\\git2\\Taster2\\Taster\\Taster\\WebContent\\images\\shop\\";
	
	private int shop_idx;
	
public AdminShopDeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
//게시글 글 삭제
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성.
		paramClass = new ShopBean();
		resultClass = new ShopBean();
		
		// 해당 번호의 글을 가져온다.
		resultClass = (ShopBean) sqlMapper.queryForObject("Shop-selectOne", getShop_idx());

		//서버 파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();

		// 삭제할 항목 설정.
		paramClass.setShop_idx(getShop_idx());
				
		// 삭제 쿼리 수행.
		sqlMapper.update("Shop-deleteIdx", paramClass);

		return SUCCESS;

	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		AdminShopDeleteAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminShopDeleteAction.sqlMapper = sqlMapper;
	}
	public ShopBean getParamClass() {
		return paramClass;
	}
	public void setParamClass(ShopBean paramClass) {
		this.paramClass = paramClass;
	}
	public ShopBean getResultClass() {
		return resultClass;
	}
	public void setResultClass(ShopBean resultClass) {
		this.resultClass = resultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
