package member;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionSupport;

public class SendEmail extends ActionSupport {

   private String from;
   private String password;
   private String to;
   private String subject;
   private String body;
   private String member_email;
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

   public String execute() 
   {
      String ret = SUCCESS;
      try
      {
    	  	String[] beforeShuffle = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };  
    	    List list = Arrays.asList(beforeShuffle);  
    	    Collections.shuffle(list);  
    	    StringBuilder sb = new StringBuilder();  
    	    for (int i = 0; i <list.size(); i++) {  
    	        sb.append(list.get(i));  
    	    }  
    	    String afterShuffle = sb.toString();  
    	    result = afterShuffle.substring(5, 9);
    	  	System.out.println("getemail() : " + getMember_email());
    	    from = "khstudy3@gmail.com";
    	    password = "1234qazwsx";
    	    to = getMember_email();
    	  	subject = "맛객 인증번호";
    	  	body = "요청하신 인증번호를 발송해드립니다.\n\n"
    	  			+ "아래의 인증번호를 인증번호 입력창에 입력해 주세요.\n\n\n"
    	  			+ "인증번호 : "+result+"\n\n\n"
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

   public static Properties getProperties() {
      return properties;
   }

   public static void setProperties(Properties properties) {
      SendEmail.properties = properties;
   }

	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	   
	   
}