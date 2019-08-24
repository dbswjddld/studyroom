package co.yedam.studyroom.common;

public class Paging {
	
	//20190823 곽동우 페이지 처리
	private int page = 1;//현재 페이지	 oo
	private int totalPage;  //총 페이지수
	private int countPage = 5;	//화면에 page블럭 몇개 보일건지 oo
	private int countList = 10;	//게시글 몇개 뿌릴거(기본10)?	oo
	private int totalCount; //총게시글수
	private int startPage;	//화면에 보이는 시작페이지
	private int endPage; 	//화면에 보이는 마지막 페이지
	
	public void totalPage() {
		this.totalPage = totalCount / countList;	//총페이지수 = 총게시글수 / 한화면에나오는게시글수 + 0?1?
		if(totalCount%countList > 0) {	//나머지 0 보다크면 1증가			
			this.totalPage++;
		}
	}
	
	public void startPage() {
		this.startPage = ((page-1)/countPage)*countPage+1;
	}
	
	public void endPage() {
		int endPage =  startPage+countPage-1;
		
		if(endPage > this.totalPage) {	//endpage 가 totalpage 보다 크면 totalpage값으로 
			this.endPage = this.totalPage;
		} else {
			this.endPage = endPage;
		}
	}
	
	//한번호출로 값 다처리되는거?
	public void run(int totalCount) {
		setTotalCount(totalCount);
		totalPage();
		startPage();
		endPage();
	}
	
	
	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getCountList() {
		return countList;
	}

	public void setCountList(int countList) {
		this.countList = countList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	
	
	
}
