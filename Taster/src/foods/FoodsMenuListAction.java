package foods;

import java.io.IOException;
import java.io.Reader;

import java.util.Date;
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
	
	private String category;
	//������
	public FoodsMenuListAction() throws IOException{
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	
	public String form() throws Exception{  //foods_menu_list.jsp�� ���̵�
		setCategory("menu");
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
	
	
}