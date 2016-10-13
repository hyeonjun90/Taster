package member;

public class MyPagePagingAction {
	
	private int currentPage;  //현재 페이지
	private int totalCount;   //전체 게시물 수 
	private int totalPage;    //전체 페이지 수 
	private int blockCount;   //현재 페이지의 게시물 수 
	private int blockPage; 	  //한 화면에 보여줄 페이지 수 
	private int startCount;   //현재 페이지에 보여줄 게시글의 시작 번호
	private int endCount; 	  //현재 페이지에 보여줄 게시글의 끝 번호
	private int startPage; 	  //시작페이지 
	private int endPage;	  //끝 페이지 
	
	private StringBuffer pagingHtml;    //이전,다음 을 만들기 위한 HTML 테그 StringBuffer
	
	//생성자
	public MyPagePagingAction(int currentPage, int totalCount, int blockCount, int blcokPage){
		
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		
		//전체 페이지 계산 ->(int)Math.ceil(전체 게시글/현재 페이지의 게시글 수)
		totalPage=(int)Math.ceil((double) totalCount/blockCount);
		
		//전체 페이지 초기값 설정 
		if(totalPage==0){
			totalPage = 1;
		}
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		//게시글과 페이지의 start와 end값 설정 
		startCount=(currentPage -1)*blockCount; //현재 페이지에 보여줄 게시글의 시작 번호((현재페이지-1)*한 화면에 보여줄 리뷰글 수)
		endCount =  startCount + blockCount-1;//현재 페이지에 보여줄 게시글의 끝 번호(게시글 시작번호+한 화면에 보여줄 리뷰글 수-1)
		
		startPage=(int)((currentPage - 1)/blockPage)*blockPage + 1;//화면에 보여줄 페이징 시작 번호(((현재페이지-1)/한 화면에 나타낼 페이지수)*한 화면에 나타낼 페이지수+1)
		endPage = startPage+blockPage -1; //(시작페이지+한화면에 나타낼 페이지 수 -1)
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		//pagingHtml StringBuffer 선언
		pagingHtml = new StringBuffer();
		
		//pagingHtml 이전 테그와 액션을 html로 맵핑(이전을 누르면 현재 페이지의 전페이지로 이동) 
		if(currentPage>blockPage){
			pagingHtml.append("<a href=memberMyPage.action?currentPage=" + (startPage-1)+">");
			pagingHtml.append("이전");
			pagingHtml.append("</a>");
		}
		
		pagingHtml.append("&nbsp;|&nbsp;");
		
		//한 화면에 보여줄 페이지를 출력해주고 현재 페이지를 강조 하고 링크를 제거하는 Html
		for(int i=startPage; i<=endPage; i++){
			if(i>totalPage){
				break;
			}
			if(i==currentPage){     //현재 페이지일때 링크를 없애고 빨간색으로 강조 
				pagingHtml.append("&nbsp;<b><font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("<.font></b>");
			}else{                 //그외 페이지일 때는 링크 액션 맵핑
				pagingHtml.append("&nbsp;<a href='memberMyPage.action?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append("'>");
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;");
		}
		
		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		
		//pagingHtml 다음 테그와 액션을 html로 맵핑(다음을 누르면 현재 페이지의 다음페이지로 이동)
		if(totalPage-startPage >= blockPage){      //한 페이지에 나타낼 페이지 수보다 그 다음 페이지가 존재 한다면 
			pagingHtml.append("&nbsp;<a href='memberMyPage.action?currentPage=");
			pagingHtml.append((endPage+1));
			pagingHtml.append("'>");
			pagingHtml.append("다음");
			pagingHtml.append("</a>");
			
		}
		
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBlockCount() {
		return blockCount;
	}
	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public StringBuffer getPagingHtml(){
		return pagingHtml;
	}
	public void setPageingHtml(StringBuffer pagingHtml){
		this.pagingHtml = pagingHtml;
	}

}
