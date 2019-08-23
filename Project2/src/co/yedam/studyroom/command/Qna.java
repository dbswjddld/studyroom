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
		Paging p = new Paging();
		
		p.setTotalCount(dao.boardCount());
		p.totalPage();
		p.startPage();
		p.endPage();
		
		System.out.println(p.getTotalPage());
		
		
		
		
		
		
		list = dao.boardList();
		request.setAttribute("list", list);
		String viewPage = "jsp/qna.jsp";	//바꿔야함 test중
		HttpRes.forward(request, response, viewPage);
	}

}
