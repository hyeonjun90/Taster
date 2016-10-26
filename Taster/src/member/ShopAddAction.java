package member;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bean.*; 

public class ShopAddAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private RequestListBean paramClass;//�Ķ���͸� ������ ��
	HashMap<String, Object> map = new HashMap<>();

	
	private Map session; //ȸ�� ���̵� �޾ƿ� Map��ü 
	
	private int r_idx; //�ε��� �⺻Ű
	private Date r_regdate; //��û�� �ۼ���
	private String r_id; //�ۼ��� ���̵�s
	private String r_nicname; //�ۼ��� �г���
	private String r_shop_name; //�����̸�
	private String r_shop_tel; //������ȭ��ȣ
	private String r_shop_kind; //����
	private String r_shop_addr1; //�ּ�1(��/��)
	private String r_shop_addr2; //�ּ�2(��,��,��)
	private String r_shop_addr3; //�ּ�3(��)
	private String r_shop_addr4; //�ּ�4(������)
	private String r_shop_price; //���ݴ�
	private String r_shop_holiday; //����
	private String r_shop_content; //�Է³���
	
	private String r_shop_file_orgname; //���Ͽ����̸�
	private String r_shop_file_savname; //���������
	
	Calendar today = Calendar.getInstance();
	
	private File upload; //���� ��ü
	private String uploadContentType; //������ Ÿ��
	private String uploadFileName; //���� �̸�
	
	private String fileUploadPath="C:\\git\\Taster\\Taster\\WebContent\\images\\temporary_shop\\";



	//������
	public ShopAddAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{ //�Ĵ��� �� �̵� 
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{   //�Ĵ� ��� �Ϸ� 
		
		paramClass= new RequestListBean();
		
		paramClass.setR_idx(r_idx);
		paramClass.setR_regdate(today.getTime());
		
		System.out.println("���� : " + session.get("member_id").toString());
		
		paramClass.setR_id(session.get("member_id").toString());
		paramClass.setR_nicname(session.get("member_nicname").toString());
		paramClass.setR_shop_name(r_shop_name);
		paramClass.setR_shop_tel(r_shop_tel);
		paramClass.setR_shop_holiday(r_shop_holiday);
		paramClass.setR_shop_kind(r_shop_kind);
		paramClass.setR_shop_price(r_shop_price);
		paramClass.setR_shop_content(r_shop_content);
		
		paramClass.setR_shop_addr1(r_shop_addr1);
		paramClass.setR_shop_addr2(r_shop_addr2);
		paramClass.setR_shop_addr3(r_shop_addr3);
		paramClass.setR_shop_addr4(r_shop_addr4);
		
		//System.out.println("paramgetR_id : " + paramClass.getR_id());
		
		paramClass.setR_shop_file_orgname(r_shop_file_orgname);
		paramClass.setR_shop_file_savname(r_shop_file_savname);
		
		sqlMapper.insert("AprReq-insertReqList", paramClass);
		r_idx = (int) sqlMapper.queryForObject("AprReq-getIdx");
		
		if(getUpload() != null){
			
			System.out.println("test");
			//���� ������ ����� ���� �̸��� Ȯ���� ����.
			String file_name="file_" + r_idx;
			r_shop_file_orgname = getUploadFileName();
			r_shop_file_savname = "file_" + r_idx;
			
			System.out.println("file_name : " + file_name);
			System.out.println("r_shop_file_orgname: "+r_shop_file_orgname);
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());
			
			map.put("r_idx", r_idx);
			map.put("r_shop_file_orgname", r_shop_file_orgname);
			map.put("r_shop_file_savname", r_shop_file_savname);
			
			//������ ���� ����
			System.out.println("fileUploadPath + file_name + file_ext : " + fileUploadPath + file_name + "." + file_ext);
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			//���� ���� ������Ʈ
			sqlMapper.update("updateFileUpload2", map);
			System.out.println("���Ͼ��ε� �Ϸ�");
		}
	
		return SUCCESS;
	}
	

	
	public String zipcode() throws Exception {
		return SUCCESS;
	}
	
	
	
	public RequestListBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RequestListBean paramClass) {
		this.paramClass = paramClass;
	}
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_nicname() {
		return r_nicname;
	}

	public void setR_nicname(String r_nicname) {
		this.r_nicname = r_nicname;
	}

	public String getR_shop_name() {
		return r_shop_name;
	}

	public void setR_shop_name(String r_shop_name) {
		this.r_shop_name = r_shop_name;
	}

	public String getR_shop_tel() {
		return r_shop_tel;
	}
	public void setR_shop_tel(String r_shop_tel) {
		this.r_shop_tel = r_shop_tel;
	}

	public String getR_shop_kind() {
		return r_shop_kind;
	}

	public void setR_shop_kind(String r_shop_kind) {
		this.r_shop_kind = r_shop_kind;
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

	public String getR_shop_price() {
		return r_shop_price;
	}

	public void setR_shop_price(String r_shop_price) {
		this.r_shop_price = r_shop_price;
	}

	public String getR_shop_holiday() {
		return r_shop_holiday;
	}

	public void setR_shop_holiday(String r_shop_holiday) {
		this.r_shop_holiday = r_shop_holiday;
	}
	
	public String getR_shop_content() {
		return r_shop_content;
	}
	
	public void setR_shop_content(String r_shop_content) {
		this.r_shop_content = r_shop_content;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
	public String getR_shop_file_orgname() {
		return r_shop_file_orgname;
	}

	public void setR_shop_file_orgname(String r_shop_file_orgname) {
		this.r_shop_file_orgname = r_shop_file_orgname;
	}

	public String getR_shop_file_savname() {
		return r_shop_file_savname;
	}

	public void setR_shop_file_savname(String r_shop_file_savname) {
		this.r_shop_file_savname = r_shop_file_savname;
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
