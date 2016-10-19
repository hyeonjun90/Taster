package bean;

import java.util.Date;

public class RecomBoardBean { // 추천맛집 게시판 bean

	private int rec_idx; //인덱스 기본키
	private Date rec_date; //작성일
	private String rec_subject; //제목
	private String rec_content; //내용
	private String rec_image; //사진미리보기

	public int getRec_idx() {
		return rec_idx;
	}
	public void setRec_idx(int rec_idx) {
		this.rec_idx = rec_idx;
	}
	public Date getRec_date() {
		return rec_date;
	}
	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}
	public String getRec_subject() {
		return rec_subject;
	}
	public void setRec_subject(String rec_subject) {
		this.rec_subject = rec_subject;
	}
	
	public String getRec_content() {
		return rec_content;
	}
	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}
	public String getRec_image() {
		return rec_image;
	}
	public void setRec_image(String rec_image) {
		this.rec_image = rec_image;
	}

	
}
