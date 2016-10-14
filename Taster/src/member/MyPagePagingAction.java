package member;

public class MyPagePagingAction {
	
	private int currentPage;  //���� ������
	private int totalCount;   //��ü �Խù� �� 
	private int totalPage;    //��ü ������ �� 
	private int blockCount;   //���� �������� �Խù� �� 
	private int blockPage; 	  //�� ȭ�鿡 ������ ������ �� 
	private int startCount;   //���� �������� ������ �Խñ��� ���� ��ȣ
	private int endCount; 	  //���� �������� ������ �Խñ��� �� ��ȣ
	private int startPage; 	  //���������� 
	private int endPage;	  //�� ������ 
	
	private StringBuffer pagingHtml;    //����,���� �� ����� ���� HTML �ױ� StringBuffer
	
	//������
	public MyPagePagingAction(int currentPage, int totalCount, int blockCount, int blcokPage){
		
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		
		//��ü ������ ��� ->(int)Math.ceil(��ü �Խñ�/���� �������� �Խñ� ��)
		totalPage=(int)Math.ceil((double) totalCount/blockCount);
		
		//��ü ������ �ʱⰪ ���� 
		if(totalPage==0){
			totalPage = 1;
		}
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		//�Խñ۰� �������� start�� end�� ���� 
		startCount=(currentPage -1)*blockCount; //���� �������� ������ �Խñ��� ���� ��ȣ((����������-1)*�� ȭ�鿡 ������ ����� ��)
		endCount =  startCount + blockCount-1;//���� �������� ������ �Խñ��� �� ��ȣ(�Խñ� ���۹�ȣ+�� ȭ�鿡 ������ ����� ��-1)
		
		startPage=(int)((currentPage - 1)/blockPage)*blockPage + 1;//ȭ�鿡 ������ ����¡ ���� ��ȣ(((����������-1)/�� ȭ�鿡 ��Ÿ�� ��������)*�� ȭ�鿡 ��Ÿ�� ��������+1)
		endPage = startPage+blockPage -1; //(����������+��ȭ�鿡 ��Ÿ�� ������ �� -1)
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		//pagingHtml StringBuffer ����
		pagingHtml = new StringBuffer();
		
		//pagingHtml ���� �ױ׿� �׼��� html�� ����(������ ������ ���� �������� ���������� �̵�) 
		if(currentPage>blockPage){
			pagingHtml.append("<a href=memberMyPage.action?currentPage=" + (startPage-1)+">");
			pagingHtml.append("����");
			pagingHtml.append("</a>");
		}
		
		pagingHtml.append("&nbsp;|&nbsp;");
		
		//�� ȭ�鿡 ������ �������� ������ְ� ���� �������� ���� �ϰ� ��ũ�� �����ϴ� Html
		for(int i=startPage; i<=endPage; i++){
			if(i>totalPage){
				break;
			}
			if(i==currentPage){     //���� �������϶� ��ũ�� ���ְ� ���������� ���� 
				pagingHtml.append("&nbsp;<b><font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("<.font></b>");
			}else{                 //�׿� �������� ���� ��ũ �׼� ����
				pagingHtml.append("&nbsp;<a href='memberMyPage.action?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append("'>");
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;");
		}
		
		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
		
		//pagingHtml ���� �ױ׿� �׼��� html�� ����(������ ������ ���� �������� ������������ �̵�)
		if(totalPage-startPage >= blockPage){      //�� �������� ��Ÿ�� ������ ������ �� ���� �������� ���� �Ѵٸ� 
			pagingHtml.append("&nbsp;<a href='memberMyPage.action?currentPage=");
			pagingHtml.append((endPage+1));
			pagingHtml.append("'>");
			pagingHtml.append("����");
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
