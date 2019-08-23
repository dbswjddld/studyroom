package co.yedam.studyroom.common;

public class Paging {
	
	//20190823 곽동우 페이지 처리
	private int page;//현재 페이지
	private int totalPage;  //총 페이지수
	private int countPage;	//화면에 page 몇개 보일건지
	private int countList;	//게시글 몇개 뿌릴거?
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
		this.endPage = startPage+countPage-1;
	}
	
	
	
}
