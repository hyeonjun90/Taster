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
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private String category; // 상단 메뉴 색깔 표시
	private int rec_idx;
	
	private ArrayList<RecomBoardBean> RecomList = new ArrayList<RecomBoardBean>(); //추천리스트 반복보기용
	
	//생성자
	public FoodsRecommendListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
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