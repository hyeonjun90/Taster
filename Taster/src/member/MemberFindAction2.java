package member;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class MemberFindAction2 extends ActionSupport {
	
	private String member_name;
	private String member_id;
	private String member_email;
	private String emailOk;
	private String member_pwd;
	
	private String from;
    private String password;
    private String to;
    private String subject;
    private String body;
    private String result;
    
    static Properties properties = new Properties();
    static
    {
       properties.put("mail.smtp.host", "smtp.gmail.com");
       properties.put("mail.smtp.socketFactory.port", "465");
       properties.put("mail.smtp.socketFactory.class",
                      "javax.net.ssl.SSLSocketFactory");
       properties.put("mail.smtp.auth", "true");
       properties.put("mail.smtp.port", "465");
    }

	
	private MemberBean resultClass;
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	
	//생성자
	public MemberFindAction2() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
		reader.close();
	}
	
	public String findMemberId() throws Exception {
		member_id = (String) sqlMapper.queryForObject("findMemberId", getMember_email());
		if(member_id == null) {
			member_id = "false";
		}
		return SUCCESS;
	}
	public String findMemberPwd() throws Exception {
		member_pwd = (String) sqlMapper.queryForObject("findMemberPwd", getMember_email());
		if(member_email == null) {
			emailOk = "false";
		} else {
			emailOk = getMember_email();
			
			String ret = SUCCESS;
		      try {
		    	  
		    	    from = "khstudy3@gmail.com";
		    	    password = "1234qazwsx";
		    	    to = member_email;
		    	  	subject = "맛객 비밀번호입니다.";
		    	  	body = "요청하신 비밀번호를 발송해드립니다.\n\n"
		    	  			+ "아래의 비밀번호로 로그인 해주세요.\n\n\n"
		    	  			+ "비밀번호 : "+member_pwd+"\n\n\n"
		    	  			+ ""
		    	  			+ "맛객을 이용해 주셔서 감사합니다.\n더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다."
		    	  			+ "";
		    	  	
		         Session session = Session.getDefaultInstance(properties,  
		            new javax.mail.Authenticator() {
		            protected PasswordAuthentication 
		            getPasswordAuthentication() {
		            return new 
		            PasswordAuthentication(from, password);
		            }});

		         Message message = new MimeMessage(session);
		         message.setFrom(new InternetAddress(from));
		         message.setRecipients(Message.RecipientType.TO, 
		            InternetAddress.parse(to));
		         message.setSubject(subject);
		         message.setText(body);
		         Transport.send(message);
		      }
		      catch(Exception e)
		      {
		         ret = SUCCESS;
		         e.printStackTrace();
		      }
		      return ret;
		}
		return SUCCESS;
	}
	public String form() throws Exception { //회원가입 폼 이동
		
		return SUCCESS;
	}


	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public MemberBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getEmailOk() {
		return emailOk;
	}

	public void setEmailOk(String emailOk) {
		this.emailOk = emailOk;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}


}




















