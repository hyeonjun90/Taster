package admin;


import com.opensymphony.xwork2.ActionSupport;

import bean.ShopBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.InputStream;
import java.io.IOException;

public class AdminShopListDetailView extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ShopBean paramClass = new ShopBean();
	private ShopBean resultClass = new ShopBean();
	
	private int currentPage;
	private int shop_idx;
	
	private InputStream inputStream;
	private String contentDiposition;
	private long contentLength;
	
	public AdminShopListDetailView() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception {

		resultClass = (ShopBean) sqlMapper.queryForObject("Shop-selectOne", getShop_idx());
		
		return SUCCESS;
	}


	public static Reader getReader() {
		return reader;
	}


	public static void setReader(Reader reader) {
		AdminShopListDetailView.reader = reader;
	}


	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}


	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminShopListDetailView.sqlMapper = sqlMapper;
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


	public int getShop_idx() {
		return shop_idx;
	}


	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
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
