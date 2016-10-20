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
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private String member_id;
	private String member_name;
	private String member_email;
	
	private MemberBean resultClass;
	
	private int idChk;
	
	//생성자
	public MemberFindAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String form() throws Exception { //회원가입 폼 이동
		
		return SUCCESS;
	}
	
	public String findId() throws Exception { // 아이디 찾기
		resultClass = new MemberBean();
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_name", getMember_name());
		map.put("member_email", getMember_email());
		
		resultClass = (MemberBean) sqlMapper.queryForObject("findId", map);
		System.out.println("resultClass.memberid : " + resultClass.getMember_id());
		
		if(resultClass != null) { // 회원 이름과 이메일이 일치하면 이메일로 ID 전송
			System.out.println("정보 있다");
		} else { // 정보가 없으면
			System.out.println("정보 없음");
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

























