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
	
	private int shop_idx;			// 기본키
	private String shop_name;		// 식당명
	private String shop_tel;		// 전번
	private String shop_kind;		// 업종
	private String shop_addr1;		// 식당주소1(특별시, 광역시, 도)
	private String shop_addr2;		// 식당주소2(시, 구, 군)
	private String shop_addr3;		// 식당주소3(동)
	private String shop_addr4;		// 식당주소4(나머지)
	private String shop_price;		// 가격대
	private String shop_holiday;	// 휴일
	private String old_file;


	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\Users\\jinwo\\git\\Taster\\Taster\\WebContent\\images\\shop\\"; //업로드 경로.

public AdminShopModifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
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
		
		//실제 서버에 저장될 파일 이름과 확장자 설정.
		String file_name = "file_" + getShop_idx();
	    String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
		
		//이전 파일 삭제
		File deleteFile = new File(fileUploadPath + getOld_file());
		deleteFile.delete();
		
		//새 파일 업로드
		File destFile = new File(fileUploadPath + file_name + "." + file_ext);
		FileUtils.copyFile(getUpload(), destFile);
		
		//파일 정보 파라미터 설정.
		paramClass.setFile_orgname(getUploadFileName());
		paramClass.setFile_savname(file_name + "." + file_ext);
		
		//파일 정보 업데이트.
		sqlMapper.update("UpdateFileUpload", paramClass);
	}
	// 수정이 끝나면 view 페이지로 이동.
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
