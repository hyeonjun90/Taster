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

public class FoodsDetailAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private FoodsDetailBean FDBean = new FoodsDetailBean(); 
	private ArrayList<FoodsDetailBean> RevList = new ArrayList<FoodsDetailBean>(); //리뷰(코멘트) 리스트
	private int[] PunggaList; //평가점수 카운팅용
	
	private int shop_idx; //샵 인덱스
	private int rTotalCount; //총 리뷰 수 
	
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
			
		//setCategory("detail");
		//currentPage = 1;
		//beforeSize = 0;
				//fTotalCount = (int)sqlMapper.queryForObject("");
				
		//pageSize = pageSize * currentPage;
				FDBean = (FoodsDetailBean) sqlMapper.queryForObject("foodsDetail", getShop_idx()); //식당정보 불러오기 
				System.out.println(shop_idx);
				RevList = (ArrayList<FoodsDetailBean>)sqlMapper.queryForList("reviewList", getShop_idx()); //리뷰(코멘트) 리스트 출력

				//System.out.println("fList.size: " + fList.size());
				//sqlMapper.update("updateReadHit",FDBean);
				
				return SUCCESS;
				
	}
	
	public int[] countPungga() throws Exception {
		
		PunggaList[0] = (int) sqlMapper.queryForObject("counTotalPungga");
		PunggaList[1] = (int) sqlMapper.queryForObject("countPungga1");
		PunggaList[2] = (int) sqlMapper.queryForObject("countPungga2");
		PunggaList[3] = (int) sqlMapper.queryForObject("countPungga3");

		return (int[])PunggaList;
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

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		FoodsDetailAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		FoodsDetailAction.sqlMapper = sqlMapper;
	}

	public int getrTotalCount() {
		return rTotalCount;
	}

	public void setrTotalCount(int rTotalCount) {
		this.rTotalCount = rTotalCount;
	}
	
}
