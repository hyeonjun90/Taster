package member;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;


public class MemberJoinAction extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String member_id;
	private String member_pwd;
	private String member_nicname;
	private String member_name;
	private String member_phone;
	private String member_addr;
	private String member_zipcode;
	private String member_image;
	private Date member_joinDate; //������
	private Date member_loginDate; // �ֱ� �α���
	private int p_idx;  // ȸ�� ��� 1.���� 2.������ 3.������
	
	private int chk; // ���̵� �ߺ�üũ ����
	private int chk2; //�г��� �ߺ�üũ ���� 

	
	private MemberBean memberBean;
	Calendar cal = Calendar.getInstance();
	 
	//������
	public MemberJoinAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String form() throws Exception { //ȸ������ �� �̵�
		
		return SUCCESS;
	}
	
	public String execute() throws Exception { // ȸ������ �Ϸ�
		memberBean = new MemberBean();
		
		memberBean.setMember_id(member_id);
		memberBean.setMember_pwd(member_pwd);
		memberBean.setMember_nicname(member_nicname);
		memberBean.setMember_name(member_name);
		memberBean.setMember_phone(member_phone);
		memberBean.setMember_addr(member_addr);
		memberBean.setMember_zipcode(member_zipcode);
		memberBean.setMember_image(member_image);
		memberBean.setMember_joinDate(cal.getTime());
		
		sqlMapper.insert("insertMember", memberBean);
		 
		return SUCCESS;
	}

	public String idCheck() throws Exception { // ���̵� �ߺ�üũ
		chk = (int) sqlMapper.queryForObject("idCheck", getMember_id());
		return SUCCESS;
	}
	public String nicCheck() throws Exception { // �г��� �ߺ�üũ
		chk2 = (int) sqlMapper.queryForObject("nicCheck", getMember_nicname());
		return SUCCESS;
	}

	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_nicname() {
		return member_nicname;
	}

	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public Date getMember_joinDate() {
		return member_joinDate;
	}

	public void setMember_joinDate(Date member_joinDate) {
		this.member_joinDate = member_joinDate;
	}

	public Date getMember_loginDate() {
		return member_loginDate;
	}

	public void setMember_loginDate(Date member_loginDate) {
		this.member_loginDate = member_loginDate;
	}

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}

	public int getChk2() {
		return chk2;
	}

	public void setChk2(int chk2) {
		this.chk2 = chk2;
	}
	
	
	
}



















