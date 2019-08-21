package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.BoardDao;
import co.yedam.studyroom.dto.BoardDto;

public class QnaRead implements Command {
	/*
	 * 20190820 10:59
	 * 문의게시판 command
	 * 곽동우
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		BoardDao dao = new BoardDao();
		BoardDto dto = null;	
		int bno = Integer.parseInt(request.getParameter("bno"));
		dto = dao.boardSelect(bno);		//조회한 게시글
								//여기 게시글에 달린 댓글추가?
		request.setAttribute("dto", dto);
		String viewPage = "jsp/qnaread.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
