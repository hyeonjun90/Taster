package foods;

import java.io.IOException;
import java.io.Reader;

import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bean.FoodsDetailBean;
import bean.FoodsMenuListBean;
import bean.ReviewBean;
import bean.ReviewCntBean;

public class FoodsDetailAction extends ActionSupport implements SessionAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private FoodsDetailBean FDBean = new FoodsDetailBean(); 
	private ArrayList<FoodsDetailBean> RevList = new ArrayList<FoodsDetailBean>(); //리뷰(코멘트) 리스트
	
	private int shop_idx; //샵 인덱스
	private ReviewCntBean rCntBean; // 리뷰 수 Bean
	
	private Map session;
	private ArrayList<Integer> bookList;
	private int bookOk;
	String member_id;
	
	String[] imgList; // 리뷰 이미지 담을 배열
	
	//private String category;
	
	public FoodsDetailAction() throws IOException { //생성자
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		FDBean = (FoodsDetailBean) sqlMapper.queryForObject("foodsDetail", getShop_idx()); //식당정보 불러오기
		RevList = (ArrayList<FoodsDetailBean>)sqlMapper.queryForList("reviewList", getShop_idx()); //리뷰(코멘트) 리스트 출력
		String img = "";
		for(int i=0; i<RevList.size(); i++) {
			if(RevList.get(i).getR_image() != null) 
				img += RevList.get(i).getR_image().trim();	
		}
		
		imgList = img.split("\\|");
		System.out.println("imgList : " + imgList[0]);
		HashMap<String, Object> map = new HashMap<>();
		//System.out.println("session.member_id : " + session.get("member_id").toString());
		if(session.get("member_id") != null) {
			map.put("member_id", session.get("member_id").toString());
		} else {
			map.put("member_id", "");
		}
		map.put("shop_idx", getShop_idx());
		
		bookOk = (int) sqlMapper.queryForObject("bookOk", map);
		rCntBean = (ReviewCntBean) sqlMapper.queryForObject("review_pungga_cnt", getShop_idx()); // 리뷰 평가별 개수 구하기
		return SUCCESS;
				
	}
	
	
	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public FoodsDetailBean getFDBean() {
		return FDBean;
	}

	public void setFDBean(FoodsDetailBean fDBean) {
		FDBean = fDBean;
	}

	public ArrayList<FoodsDetailBean> getRevList() {
		return RevList;
	}

	public void setRevList(ArrayList<FoodsDetailBean> revList) {
		RevList = revList;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public ArrayList<Integer> getBookList() {
		return bookList;
	}

	public void setBookList(ArrayList<Integer> bookList) {
		this.bookList = bookList;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public ReviewCntBean getrCntBean() {
		return rCntBean;
	}

	public void setrCntBean(ReviewCntBean rCntBean) {
		this.rCntBean = rCntBean;
	}

	public String[] getImgList() {
		return imgList;
	}

	public void setImgList(String[] imgList) {
		this.imgList = imgList;
	}

	public int getBookOk() {
		return bookOk;
	}

	public void setBookOk(int bookOk) {
		this.bookOk = bookOk;
	}
	
}
