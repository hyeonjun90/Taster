package bean;

import java.util.Date;

public class QnABoardListBean { 
	
	private int b_idx;			// �⺻Ű
	private String b_title;		// ����
	private String b_content;	// ����
	private String b_pwd;		// ���
	private Date b_regdate;		// �ۼ���
	private int b_readCount;	// ��ȸ��
	private String member_id; 	// MEMBER���̺��� member_id
	
	private String member_nicname;
	
	
	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_readCount() {
		return b_readCount;
	}

	public void setB_readCount(int b_readCount) {
		this.b_readCount = b_readCount;
	}

	public String getMember_nicname() {
		return member_nicname;
	}

	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}


	
	

	
}
