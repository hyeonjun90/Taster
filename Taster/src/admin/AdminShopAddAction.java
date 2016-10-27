package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;
import java.io.File;

import org.apache.commons.io.FileUtils;

import bean.ShopBean;

public class AdminShopAddAction extends ActionSupport{
	
public static Reader reader;
public static SqlMapClient sqlMapper;
	
private ShopBean paramClass; //파라미터를 저장 할 객체
private ShopBean resultClass;// 쿼리 결과 값 저장 객체
	
private int shop_idx;
private String shop_name;
private String shop_tel;
private String shop_price;
private String shop_kind;		// 업종

private String file_orgname;
private String file_savname;

private String shop_addr1;		// 식당주소1(특별시, 광역시, 도)
private String shop_addr2;		// 식당주소2(시, 구, 군)
private String shop_addr3;		// 식당주소3(동)
private String shop_addr4;		// 식당주소4(나머지)
private String shop_holiday;	// 휴일
private int shop_readCount;		// 조회수



private File upload; //파일 객체
private String uploadContentType; //컨텐츠 타입
private String uploadFileName; //파일 이름


private String r_shop_addr4;
private String r_shop_addr1;
private String r_shop_addr2;
private String r_shop_addr3;



private String fileUploadPath="C:\\Users\\jinwo\\git\\Taster\\Taster\\WebContent\\images\\shop\\";
//C:\\git2\\Taster2\\Taster\\Taster\\WebContent\\images\\shop\\


public AdminShopAddAction() throws IOException {
	
	reader = Resources.getResourceAsReader("sqlMapConfig.xml");
	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
	reader.close();
}

public String form() throws Exception {
	//등록 폼.
	return SUCCESS;
}

public String execute() throws Exception  {
	
	System.out.println("test");
	paramClass = new ShopBean();
	resultClass = new ShopBean();
	HashMap<String, Object> map = new HashMap<>();
	
	paramClass.setShop_name(shop_name);
	paramClass.setShop_tel(shop_tel);
	paramClass.setShop_price(shop_price);
	paramClass.setShop_kind(shop_kind);
	
	shop_addr1 = getR_shop_addr1();
	shop_addr2 = getR_shop_addr2();
	shop_addr3 = getR_shop_addr3();
	shop_addr4 = getR_shop_addr4();
	
	System.out.println("shop_addr1 : " + getR_shop_addr1());
	paramClass.setShop_addr1(shop_addr1);
	paramClass.setShop_addr2(shop_addr2);
	paramClass.setShop_addr3(shop_addr3);
	paramClass.setShop_addr4(shop_addr4);
	
	paramClass.setShop_holiday(shop_holiday);
	paramClass.setShop_readCount(shop_readCount);
	
	paramClass.setFile_orgname(file_orgname);
	paramClass.setFile_savname(file_savname);
	
	
	sqlMapper.insert("Shop-insertAshop",paramClass);
	shop_idx = (int) sqlMapper.queryForObject("Shop-getIdx");
	
	//파일 업로드 부분
	if(getUpload() !=null) {
		
		//실제 서버에 저장될 파일 이름과 확장자 설정.
		String file_name = "file_" + shop_idx;
		
		String file_ext = getUploadFileName().substring(
				getUploadFileName().lastIndexOf('.')+ 1,
				getUploadFileName().length());
		
		file_orgname = getUploadFileName();
		file_savname = "file_" + shop_idx + "." + file_ext;
		
		map.put("shop_idx", shop_idx);
		map.put("file_orgname", file_orgname);
		map.put("file_savname", file_savname);
		
		//서버에 파일 저장.
		System.out.println("fileUploadPath + file_name + file_ext : " + fileUploadPath + file_name + "." + file_ext);
		
		File destFile = new File(fileUploadPath + file_name + "."+ file_ext);
		FileUtils.copyFile(getUpload(), destFile);
		
		//파일 정보 업데이트.
		sqlMapper.update("updateFileUpload", map);
		//System.out.println("업로드 완료");
		
	}
	
	return SUCCESS;
}

public String getFile_orgname() {
	return file_orgname;
}

public void setFile_orgname(String file_orgname) {
	this.file_orgname = file_orgname;
}

public String getFile_savname() {
	return file_savname;
}

public void setFile_savname(String file_savname) {
	this.file_savname = file_savname;
}

public String getFileUploadPath() {
	return fileUploadPath;
}

public void setFileUploadPath(String fileUploadPath) {
	this.fileUploadPath = fileUploadPath;
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

public static SqlMapClient getSqlMapper() {
	return sqlMapper;
}

public static void setSqlMapper(SqlMapClient sqlMapper) {
	AdminShopAddAction.sqlMapper = sqlMapper;
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

public String getShop_price() {
	return shop_price;
}

public void setShop_price(String shop_price) {
	this.shop_price = shop_price;
}

public static Reader getReader() {
	return reader;
}

public static void setReader(Reader reader) {
	AdminShopAddAction.reader = reader;
}

public String getShop_kind() {
	return shop_kind;
}

public void setShop_kind(String shop_kind) {
	this.shop_kind = shop_kind;
}
/**
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
**/
public String getShop_holiday() {
	return shop_holiday;
}

public void setShop_holiday(String shop_holiday) {
	this.shop_holiday = shop_holiday;
}

public int getShop_readCount() {
	return shop_readCount;
}

public void setShop_readCount(int shop_readCount) {
	this.shop_readCount = shop_readCount;
}

public int getShop_idx() {
	return shop_idx;
}

public void setShop_idx(int shop_idx) {
	this.shop_idx = shop_idx;
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


public String getR_shop_addr1() {
	return r_shop_addr1;
}

public void setR_shop_addr1(String r_shop_addr1) {
	this.r_shop_addr1 = r_shop_addr1;
}

public String getR_shop_addr2() {
	return r_shop_addr2;
}

public void setR_shop_addr2(String r_shop_addr2) {
	this.r_shop_addr2 = r_shop_addr2;
}

public String getR_shop_addr3() {
	return r_shop_addr3;
}

public void setR_shop_addr3(String r_shop_addr3) {
	this.r_shop_addr3 = r_shop_addr3;
}

public String getR_shop_addr4() {
	return r_shop_addr4;
}

public void setR_shop_addr4(String r_shop_addr4) {
	this.r_shop_addr4 = r_shop_addr4;
}




}
	