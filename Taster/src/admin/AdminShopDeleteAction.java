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
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
//�Խñ� �� ����
	public String execute() throws Exception {
		
		//�Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new ShopBean();
		resultClass = new ShopBean();
		
		// �ش� ��ȣ�� ���� �����´�.
		resultClass = (ShopBean) sqlMapper.queryForObject("Shop-selectOne", getShop_idx());

		//���� ���� ����
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();

		// ������ �׸� ����.
		paramClass.setShop_idx(getShop_idx());
				
		// ���� ���� ����.
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
