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

public class MemberZipcodeAction extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private int idx; 			// �⺻Ű
	private String zipcode;		// �����ȣ
	private String sido;		// Ư����, ������, ��
	private String gugun;		// ��, ��, ��
	private String dong;		// ��
	private String ri;			// ��
	private String bldg;		// �ǹ���
	private String bunji;		// ����
	
	private ArrayList<ZipcodeBean> zipList;
	
	//������
	public MemberZipcodeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
	
	public String zipcode() throws Exception { //�����ȣ �˻� �� ����
		return SUCCESS;
	}
	
	public String zipcodeSearch() throws Exception { //�����ȣ �˻� ���
		zipList = new ArrayList<>();
		
		String keyword = "%"+URLDecoder.decode(getDong(), "utf-8")+"%";
		System.out.println(keyword);
		zipList = (ArrayList<ZipcodeBean>) sqlMapper.queryForList("zipcodeSearch", keyword);
		
		return SUCCESS;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public String getRi() {
		return ri;
	}

	public void setRi(String ri) {
		this.ri = ri;
	}

	public String getBldg() {
		return bldg;
	}

	public void setBldg(String bldg) {
		this.bldg = bldg;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	public ArrayList<ZipcodeBean> getZipList() {
		return zipList;
	}

	public void setZipList(ArrayList<ZipcodeBean> zipList) {
		this.zipList = zipList;
	}
	
	
	
	
}















