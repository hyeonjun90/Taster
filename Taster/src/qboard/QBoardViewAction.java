package qboard;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;

import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import bean.CommentBean;
//import bean.QnABoardBean;
import bean.QnABoardListBean;
//다운로드 메서드 삭제

public class QBoardViewAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnABoardListBean paramClass = new QnABoardListBean();
	private QnABoardListBean resultClass = new QnABoardListBean();
	private List<CommentBean> commentlist = new ArrayList<CommentBean>();
	
	private CommentBean cClass = new CommentBean();
	private CommentBean cResult = new CommentBean();
	
	
	private int currentPage;
	
	private int b_idx;
	private int c_idx;
	private String member_id;
	private String member_nicname;
	
	private Map session;
	
	
	//private String fileUploadPath = "C:\\Java\\Framework02\\upload\\";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	
	
	
	
	
	
	public QBoardViewAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	

	

    //게시판 글 상세보기 
	public String execute() throws Exception {
		
		paramClass.setB_idx(getB_idx());
		
		//조회수 1 증가
		sqlMapper.update("qboard-updateB_readCount",paramClass);
		
		resultClass = (QnABoardListBean) sqlMapper.queryForObject("qboard-selectOne", getB_idx());
		
		//해당 글번호값의 댓글(코멘트)목록 출력하는 쿼리문 수행
		commentlist = sqlMapper.queryForList("qboard-commentSelectAll", getB_idx());
		
		return SUCCESS;
	}
	
	
	/* id체크하는데 폼은 따로 필요 없음.
	public String checkForm() throws Exception
	{
		return SUCCESS;
	}
	*/
	
	//게시판 글 수정/삭제시  로그인중인 id와 글작성자의 id를 비교하는 메소드
	public String checkAction()	throws Exception
	{
		//paramClass.setB_idx(getB_idx());
		//paramClass.setB_pwd(getB_pwd());
		
		paramClass.setB_idx(getB_idx());
		paramClass.setMember_nicname(getMember_nicname());
		


		System.out.println(getMember_nicname());//회원의 닉네임 값을 얻어옴
		System.out.println(session.get("member_nicname"));//회원의 닉네임 값을 잘 얻어오는지 콘솔창으로 테스트
		System.out.println(session.get("member_level")); //회원의 등급을 나타내는 값을 잘 얻어오는지 콘솔창으로 테스트
		
		
		if( !getMember_id().equals(session.get("member_nicname") ) ){
			//따로 만든 에러페이지(qboard_check_error.jsp)
			return ERROR;
		}
			System.out.println("빠");
			//따로 만든 페이지(qboard_check_success.jsp)
			return SUCCESS;
	}
	// 댓글(코멘트) 삭제시  로그인중인 id와 댓글작성자의 id를 비교하는 메소드
	public String checkAction2()	throws Exception
	{
		int memberCheck=3;	//관리자 회원등급값 비교하기 위해 추가한 것
		
		cClass.setC_idx(getC_idx());
		cClass.setB_idx(getB_idx());
		
		
		//관리자만 문의게시판 댓글을 삭제 할수 있으므로...
		//로그인중인 회원의 등급과 관리자 등급이 일치하지 않으면 에러를 내뿜는다.
		if(memberCheck != (Integer)session.get("member_level") ){
			return ERROR;
		}
		return SUCCESS;
	}

	public List<CommentBean> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<CommentBean> commentlist) {
		this.commentlist = commentlist;
	}

	public QnABoardListBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(QnABoardListBean paramClass) {
		this.paramClass = paramClass;
	}

	public QnABoardListBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(QnABoardListBean resultClass) {
		this.resultClass = resultClass;
	}

	public CommentBean getcClass() {
		return cClass;
	}

	public void setcClass(CommentBean cClass) {
		this.cClass = cClass;
	}

	public CommentBean getcResult() {
		return cResult;
	}

	public void setcResult(CommentBean cResult) {
		this.cResult = cResult;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	

	
	public String getMember_nicname() {
		return member_nicname;
	}
	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}






	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	
	
	
	@Override
	   public void setSession(Map session) {
	      // TODO Auto-generated method stub  
			this.session = session;
	   }
	   public Map getSession() {
	      return session;
	   }

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	
	/*	필요 없다고 판단하였음.
	public String getB_pwd() {
		return b_pwd;
	}
	
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	*/
	 
	/*
	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}*/
	

}
