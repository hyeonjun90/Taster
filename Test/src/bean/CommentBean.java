package bean;

import java.sql.Date;

public class CommentBean { // ���ǰԽ��� �亯 Bean
	private int c_idx; //�ε���
	private String c_content; //����
	private Date c_regdate; // �ۼ���
	private int b_idx; // �Խ��� b_idx ���� (FK)
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	
	
}
