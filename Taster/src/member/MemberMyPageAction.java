package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import bean.*;
import member.*;
import common.*;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import common.PagingAction;

public class MemberMyPageAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<JoinR_B_S> reviewList = new ArrayList<JoinR_B_S>();
	private List<JoinR_B_S> bookmarkList = new ArrayList<JoinR_B_S>();
	
	private int currentPage=1;
	private int totalCount;
	private int blockCount=5;
	private int blockPage=5;
	private String pagingHtml;
	private PagingAction page;
	
	private String r_image;
	private String shop_name;
	
	
	private int currentPage2=1;
	private int totalCount2;
	private int blockCount2=5;
	private int blockPage2=5;
	private String pagingHtml2;
	private PagingAction page2;
	
	private String r_image2;
	private String shop_name2;

	private Map session;
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	public Map getSession() {
		return session;
	}

	
	public MemberMyPageAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String execute() throws Exception{
		
		//�α��� ���� 
		//if(session.get("member_id")==null){
		//	return LOGIN;
		//}
			
		//reviewList, bookmarkList �޼ҵ带 �ҷ��� ����
		reviewListForm();
		bookmarkListForm();
		
		return SUCCESS;
	}
	
	public String reviewListForm() throws Exception{
		//System.out.println("���� : " + session.get("member_id"));
		reviewList = sqlMapper.queryForList("reviewList-selectAll", session.get("member_id"));
		
		totalCount=reviewList.size();
		
		//�ش� ������ ù��° ������ �̾� ���� ���� for����(image�� �ּұ� ������ ,�� ����� ù��° �̺��� �ּҰ��� �����´�) 
		for(int i=0; i<reviewList.size(); i++){
			
			String image = reviewList.get(i).getR_image();
			String[] imageValues = image.split(","); 
			
			if(imageValues.length == 0) {
				image = "��ϵ� ���� ����.";
			} else {
				image=imageValues[0];
			}
			reviewList.get(i).setR_image(image);  //ù��° ������ �ٽ� setR_image�� reviewList�迭�� �־��ش�.
			
			if(image.equals("")){
				continue;
			}
		}
		
		//pagingAction ��ü ����
		page=new PagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml=page.getPagingHtml().toString();
		
		// ���� �������� ������ ������ ���� ��ȣ ���� 
		int lastCount=totalCount;
		
		if(page.getEndCount()<totalCount){
			lastCount=page.getEndCount()+1;
		}
		
		//��ü ����Ʈ���� ���� ������ ��ŭ�� �����´�. 
		reviewList=reviewList.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
//---------- ���ã�� List---------------------------------------------------------------
	
	public String bookmarkListForm() throws Exception{
		
		bookmarkList=sqlMapper.queryForList("bookmarkList-selectAll", session.get("member_id"));
		
		totalCount2 = bookmarkList.size();
		
		//�ش� ������ ù��° ������ �̾� ���� ���� for����(image�� �ּұ� ������ ,�� ����� ù��° �̺��� �ּҰ��� �����´�) 
		for(int i=0; i<bookmarkList.size(); i++){
			
			String image = bookmarkList.get(i).getR_image();
			String[] imageValues = image.split(","); 
			
			if(imageValues.length == 0) {
				image = "��ϵ� ���� ����.";
			} else {
				image=imageValues[0];
			}
					
			bookmarkList.get(i).setR_image(image);  //ù��° ������ �ٽ� setR_image�� reviewList�迭�� �־��ش�.
					
			if(image ==""){
			continue;
			}
			
		}
		
		page2= new PagingAction(currentPage2, totalCount2, blockCount2, blockPage2);
		pagingHtml2 = page2.getPagingHtml().toString();
		
		int lastCount2 = totalCount2;
		
		if(page2.getEndCount()<totalCount2){
			lastCount2 = page2.getEndCount()+1;
		}
		
		bookmarkList = bookmarkList.subList(page2.getStartCount(), lastCount2);
		
		return SUCCESS;
	}
	
	
	
	public List<JoinR_B_S> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<JoinR_B_S> reviewList) {
		this.reviewList = reviewList;
	}
	
	public List<JoinR_B_S> getBookmarkList() {
		return bookmarkList;
	}

	public void setBookmarkList(List<JoinR_B_S> bookmarkList) {
		this.bookmarkList = bookmarkList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public String getR_image() {
		return r_image;
	}

	public void setR_image(String r_image) {
		this.r_image = r_image;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	public int getCurrentPage2() {
		return currentPage2;
	}

	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	public int getTotalCount2() {
		return totalCount2;
	}

	public void setTotalCount2(int totalCount2) {
		this.totalCount2 = totalCount2;
	}

	public int getBlockCount2() {
		return blockCount2;
	}

	public void setBlockCount2(int blockCount2) {
		this.blockCount2 = blockCount2;
	}

	public int getBlockPage2() {
		return blockPage2;
	}

	public void setBlockPage2(int blockPage2) {
		this.blockPage2 = blockPage2;
	}

	public String getPagingHtml2() {
		return pagingHtml2;
	}

	public void setPagingHtml2(String pagingHtml2) {
		this.pagingHtml2 = pagingHtml2;
	}

	public PagingAction getPage2() {
		return page2;
	}

	public void setPage2(PagingAction page2) {
		this.page2 = page2;
	}

	public String getR_image2() {
		return r_image2;
	}

	public void setR_image2(String r_image2) {
		this.r_image2 = r_image2;
	}

	public String getShop_name2() {
		return shop_name2;
	}

	public void setShop_name2(String shop_name2) {
		this.shop_name2 = shop_name2;
	}



}
