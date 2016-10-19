package member;

import java.io.IOException;
import java.io.Reader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.ZipcodeBean;

public class ShopZipcodeAction extends ActionSupport {
	
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private int idx;


	private String sido; //�ּ�1(��/��)
	private String gugun; //�ּ�2(��,��,��)
	private String dong; //�ּ�3(��)
	private String shop_addr4; //�ּ�4(������)
	
	private ArrayList<ZipcodeBean> zipList;
	
	public String shopZipcode() throws Exception{ //�����ȣ �˻� �� ����

		return SUCCESS;
	}
	
	public String shopZipcodeSearh() throws Exception{
		zipList = new ArrayList<>();
		
		String keyword = "%"+URLDecoder.decode(getDong(), "utf-8")+"%";
		System.out.println(keyword);
		zipList = (ArrayList<ZipcodeBean>)sqlMapper.queryForList("zipcodeSearch",keyword);
		
		return SUCCESS;
	}
 	

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getR_shop_addr4() {
		return shop_addr4;
	}

	public void setR_shop_addr4(String shop_addr4) {
		this.shop_addr4 = shop_addr4;
	}

	public ArrayList<ZipcodeBean> getZipList() {
		return zipList;
	}

	public void setZipList(ArrayList<ZipcodeBean> zipList) {
		this.zipList = zipList;
	}
	
}
