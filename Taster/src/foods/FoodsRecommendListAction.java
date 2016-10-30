package foods;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RecomBoardBean;

public class FoodsRecommendListAction  extends ActionSupport {
	public static Reader reader; //���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
	
	private String category; // ��� �޴� ���� ǥ��
	private int rec_idx;
	
	private ArrayList<RecomBoardBean> RecomList = new ArrayList<RecomBoardBean>(); //��õ����Ʈ �ݺ������
	
	//������
	public FoodsRecommendListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
		reader.close();
	}
		
	public String form() throws Exception {
		setCategory("recom");
		
		RecomList = (ArrayList<RecomBoardBean>)sqlMapper.queryForList("recommandList");
		
		return SUCCESS;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		FoodsRecommendListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		FoodsRecommendListAction.sqlMapper = sqlMapper;
	}

	public int getRec_idx() {
		return rec_idx;
	}

	public void setRec_idx(int rec_idx) {
		this.rec_idx = rec_idx;
	}

	public ArrayList<RecomBoardBean> getRecomList() {
		return RecomList;
	}

	public void setRecomList(ArrayList<RecomBoardBean> recomList) {
		RecomList = recomList;
	}
	
	
}