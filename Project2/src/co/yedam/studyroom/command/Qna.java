package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.common.Paging;
import co.yedam.studyroom.dao.BoardDao;
import co.yedam.studyroom.dto.BoardDto;

public class Qna implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//20190820 10:11  곽동우 //qna화면 리스트를위한 커맨드
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		BoardDao dao = new BoardDao();
		
		///////////////////////////////////페이지테스트중  190825 
		Paging p = new Paging();
		int page = 0;
		if(request.getParameter("page") == null) {
			page = 1; //Integer.parseInt(request.getParameter("page"));	//지금페이지
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println(request.getParameter("page"));
		int countList = 0;
		//게시글 몇개 보일건지 확인
		
		//null 오면 기본설정된 페이지수(10)만큼 보여줌
		if(request.getParameter("countList") == null) {
			countList = 3;
		} else {	//null 아니면 앞에 설정되있는값 나옴
			countList = Integer.parseInt(request.getParameter("countList"));
		}
		
		p.setPage(page); //헌재페이지
		p.setCountList(countList);	// 게시글 set
	//	p.run(dao.boardCount());	//총게시글수
		
		int endbno = p.getPage()*p.getCountList();		//끝게시글
		int startbno = endbno-(p.getCountList()-1);		//시작게시글
//		System.out.println(endbno + "끝게시글");
//		System.out.println(startbno + "처음게시글");
		list = dao.curPageBoard(startbno,endbno);
		
		System.out.println(p.getCountList());
		p.run(dao.boardCount());
		
		System.out.println("현제페이지"+p.getPage());
		System.out.println("총페이지"+p.getTotalPage()); //총페이지
		System.out.println("시작페이지 "+p.getStartPage() +"마지막페이지 "+ p.getEndPage());
		
		/////page정보 실어줌
		request.setAttribute("page", p.getPage());
		request.setAttribute("startPage", p.getStartPage());
		request.setAttribute("endPage", p.getEndPage());
		
///////////////////////////////////페이지테스트중 end
		
		//list = dao.boardList();
		request.setAttribute("list", list);
		String viewPage = "jsp/qna.jsp";	//바꿔야함 test중
		HttpRes.forward(request, response, viewPage);
	}

}
