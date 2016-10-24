package foods;

import java.io.IOException;
import java.io.Reader;

import java.util.Date;
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
import bean.ReviewBean;

public class FoodsDetailAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private FoodsDetailBean FDBean = new FoodsDetailBean(); 
	private ArrayList<ReviewBean> RevList = new ArrayList<ReviewBean>(); //¸®ºä(ÄÚ¸àÆ®) ¸®½ºÆ®
	
	private int shop_idx; //¼¥ ÀÎµ¦½º
	private int rTotalCount; //ÃÑ ¸®ºä ¼ö 
	
	//private String category;
	
	public FoodsDetailAction() throws IOException { //»ý¼ºÀÚ
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		//setCategory("detail");
		FDBean = new FoodsDetailBean();
		
		RevList = new ArrayList<>();
		//fTotalCount = (int)sqlMapper.queryForObject("");
		
		FDBean = (FoodsDetailBean) sqlMapper.queryForObject("foodsDetail", getShop_idx()); //½Ä´çÁ¤º¸ ºÒ·¯¿À±â 
	//	RevList = (ArrayList<ReviewBean>)sqlMapper.queryForList("¸®ºä¸®½ºÆ®"); //¸®ºä(ÄÚ¸àÆ®) ¸®½ºÆ® Ãâ·Â
		//System.out.println("fList.size: " + fList.size());
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
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

	public ArrayList<ReviewBean> getRevList() {
		return RevList;
	}

	public void setRevList(ArrayList<ReviewBean> revList) {
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
