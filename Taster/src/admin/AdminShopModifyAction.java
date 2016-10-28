package admin;

import com.opensymphony.xwork2.ActionSupport;

import bean.ShopBean;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class AdminShopModifyAction extends ActionSupport{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ShopBean paramClass;
	private ShopBean resultClass;
	
	private int currentPage;
	
	private int shop_idx;			// �⺻Ű
	private String shop_name;		// �Ĵ��
	private String shop_tel;		// ����
	private String shop_kind;		// ����
	private String shop_addr1;		// �Ĵ��ּ�1(Ư����, ������, ��)
	private String shop_addr2;		// �Ĵ��ּ�2(��, ��, ��)
	private String shop_addr3;		// �Ĵ��ּ�3(��)
	private String shop_addr4;		// �Ĵ��ּ�4(������)
	private String shop_price;		// ���ݴ�
	private String shop_holiday;	// ����
	private String old_file;


	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	private String fileUploadPath = "C:\\Users\\jinwo\\git\\Taster\\Taster\\WebContent\\images\\shop\\"; //���ε� ���.

public AdminShopModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
		
		
	}
public String execute()throws Exception{
	paramClass = new ShopBean();
	resultClass = new ShopBean();
	
	
	paramClass.setShop_name(getShop_name());
	paramClass.setShop_tel(getShop_tel());
	paramClass.setShop_kind(getShop_kind());
	paramClass.setShop_addr1(getShop_addr1());
	paramClass.setShop_addr2(getShop_addr2());
	paramClass.setShop_addr3(getShop_addr3());
	paramClass.setShop_addr4(getShop_addr4());
	paramClass.setShop_price(getShop_price());
	paramClass.setShop_holiday(getShop_holiday());

	sqlMapper.update("Shop-updateAshop", paramClass);
	
	if (getUpload() != null) {
		
		//���� ������ ����� ���� �̸��� Ȯ���� ����.
		String file_name = "file_" + getShop_idx();
	    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
		
		//���� ���� ����
		File deleteFile = new File(fileUploadPath + getOld_file());
		deleteFile.delete();
		
		//�� ���� ���ε�
		File destFile = new File(fileUploadPath + file_name + "." + file_ext);
		FileUtils.copyFile(getUpload(), destFile);
		
		//���� ���� �Ķ���� ����.
		paramClass.setFile_orgname(getUploadFileName());
		paramClass.setFile_savname(file_name + "." + file_ext);
		
		//���� ���� ������Ʈ.
		sqlMapper.update("UpdateFileUpload", paramClass);
	}
	// ������ ������ view �������� �̵�.
			resultClass = (ShopBean) sqlMapper.queryForObject("", getShop_idx());

			return SUCCESS;

}
public static Reader getReader() {
	return reader;
}
public static void setReader(Reader reader) {
	AdminShopModifyAction.reader = reader;
}
public static SqlMapClient getSqlMapper() {
	return sqlMapper;
}
public static void setSqlMapper(SqlMapClient sqlMapper) {
	AdminShopModifyAction.sqlMapper = sqlMapper;
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
public String getShop_name() {
	return shop_name;
}
public void setShop_name(String shop_name) {
	this.shop_name = shop_name;
}
public String getShop_tel() {
	return shop_tel;
}
public void setShop_tel(String shop_tel) {
	this.shop_tel = shop_tel;
}
public String getShop_kind() {
	return shop_kind;
}
public void setShop_kind(String shop_kind) {
	this.shop_kind = shop_kind;
}
public String getShop_addr1() {
	return shop_addr1;
}
public void setShop_addr1(String shop_addr1) {
	this.shop_addr1 = shop_addr1;
}
public String getShop_addr2() {
	return shop_addr2;
}
public void setShop_addr2(String shop_addr2) {
	this.shop_addr2 = shop_addr2;
}
public String getShop_addr3() {
	return shop_addr3;
}
public void setShop_addr3(String shop_addr3) {
	this.shop_addr3 = shop_addr3;
}
public String getShop_addr4() {
	return shop_addr4;
}
public void setShop_addr4(String shop_addr4) {
	this.shop_addr4 = shop_addr4;
}
public String getShop_price() {
	return shop_price;
}
public void setShop_price(String shop_price) {
	this.shop_price = shop_price;
}
public String getShop_holiday() {
	return shop_holiday;
}
public void setShop_holiday(String shop_holiday) {
	this.shop_holiday = shop_holiday;
}
public String getOld_file() {
	return old_file;
}
public void setOld_file(String old_file) {
	this.old_file = old_file;
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



}
