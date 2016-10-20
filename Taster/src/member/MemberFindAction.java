package member;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class MemberFindAction extends ActionSupport { 
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String member_id;
	private String member_name;
	private String member_email;
	
	private MemberBean resultClass;
	
	private int idChk;
	
	//������
	public MemberFindAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String form() throws Exception { //ȸ������ �� �̵�
		
		return SUCCESS;
	}
	
	public String findId() throws Exception { // ���̵� ã��
		resultClass = new MemberBean();
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_name", getMember_name());
		map.put("member_email", getMember_email());
		
		resultClass = (MemberBean) sqlMapper.queryForObject("findId", map);
		System.out.println("resultClass.memberid : " + resultClass.getMember_id());
		
		if(resultClass != null) { // ȸ�� �̸��� �̸����� ��ġ�ϸ� �̸��Ϸ� ID ����
			System.out.println("���� �ִ�");
		} else { // ������ ������
			System.out.println("���� ����");
		}
		return SUCCESS;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getIdChk() {
		return idChk;
	}

	public void setIdChk(int idChk) {
		this.idChk = idChk;
	}

	public MemberBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}
	
	
}

























