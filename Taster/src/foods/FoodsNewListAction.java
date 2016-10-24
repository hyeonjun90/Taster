package foods;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.SessionAware;




import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.*;

public class FoodsNewListAction  extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private FoodsNewListBean fBean;      //FoodNewList bean
	private ArrayList<FoodsNewListBean> fList; //식당 리스트를 담을 배열
	private int fTotalCount;	// 식당 전체 개수
	
	//생성자
	public FoodsNewListAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{  //foods_new_list.jsp로 폼 이동 
		fBean = new FoodsNewListBean();
		fList = new ArrayList<>();
		
		fTotalCount = (int)sqlMapper.queryForObject("foodsMenuListCount");
		fList = (ArrayList<FoodsNewListBean>) sqlMapper.queryForList("newShop-selectAll");
		System.out.println("fList.size: "+ fList.size());
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	
	public FoodsNewListBean getfBean() {
		return fBean;
	}

	public void setfBean(FoodsNewListBean fBean) {
		this.fBean = fBean;
	}

	public ArrayList<FoodsNewListBean> getfList() {
		return fList;
	}

	public void setfList(ArrayList<FoodsNewListBean> fList) {
		this.fList = fList;
	}

	public int getfTotalCount() {
		return fTotalCount;
	}

	public void setfTotalCount(int fTotalCount) {
		this.fTotalCount = fTotalCount;
	}

}