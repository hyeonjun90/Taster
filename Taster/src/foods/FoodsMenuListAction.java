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

import bean.*; 

public class FoodsMenuListAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private FoodsMenuListBean fBean;	//식당 bean
	private ArrayList<FoodsMenuListBean> fList; // 식당 리스트 담을 배열
	private int fTotalCount;	// 식당 전체 개수
	
	private String category;
	//생성자
	public FoodsMenuListAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	
	public String form() throws Exception{  //foods_menu_list.jsp로 폼이동
		setCategory("menu");
		fBean = new FoodsMenuListBean();
		fList = new ArrayList<>(); 
		
		fTotalCount = (int)sqlMapper.queryForObject("foodsMenuListCount");
		fList = (ArrayList<FoodsMenuListBean>) sqlMapper.queryForList("foodsMenuList");
		System.out.println("fList.size : " + fList.size());
		return SUCCESS;
	}
	
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}


	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}


	public int getfTotalCount() {
		return fTotalCount;
	}


	public void setfTotalCount(int fTotalCount) {
		this.fTotalCount = fTotalCount;
	}


	public FoodsMenuListBean getfBean() {
		return fBean;
	}


	public void setfBean(FoodsMenuListBean fBean) {
		this.fBean = fBean;
	}


	public ArrayList<FoodsMenuListBean> getfList() {
		return fList;
	}


	public void setfList(ArrayList<FoodsMenuListBean> fList) {
		this.fList = fList;
	}
	
	
}