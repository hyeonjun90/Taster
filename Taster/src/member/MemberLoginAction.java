package member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class MemberLoginAction extends ActionSupport implements SessionAware {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String member_id;
	private String member_pwd;
	private int member_level;
	private String member_image;
	private Map<String, Object> session;
	private MemberBean memberBean;
	
	//������
	public MemberLoginAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String execute() throws Exception { // �α��� 
		memberBean = new MemberBean();
		String db_pwd = (String)sqlMapper.queryForObject("pwdCheck", getMember_id());
		
		if(db_pwd.equals(getMember_pwd())) { // ���̵�� ��й�ȣ�� ��ġ�ϸ� �α���
			
			memberBean = (MemberBean) sqlMapper.queryForObject("getMemberInfo", getMember_id());
			
			session.put("member_id", memberBean.getMember_id());
			session.put("member_nicname", memberBean.getMember_nicname());
			session.put("member_level", memberBean.getMember_level());
			session.put("member_image", memberBean.getMember_image());
			
			return SUCCESS;
		} else { //�α��� ����
			
			return ERROR;
		}
		
	}
	public String logout() throws Exception { //�α׾ƿ� 
		if(session.get("member_id") != null){
			session.remove("member_id");
			session.remove("member_nicname");
			session.remove("member_level");
			session.remove("member_image");
			
			
		}
		return SUCCESS;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
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

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


	
	
}




































