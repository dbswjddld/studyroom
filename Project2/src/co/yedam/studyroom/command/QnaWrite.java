package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.BoardDao;
import co.yedam.studyroom.dto.BoardDto;

public class QnaWrite implements Command {

	//0823 12:25 곽동우
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDto dto = new BoardDto();
		BoardDao dao = new BoardDao();
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContent(content);
		dao.boardInsert(dto);
		response.sendRedirect("Qna.do");
//		String viewPage = "Qna.do";					// 새로고침하면 계속들어감
//		HttpRes.forward(request, response, viewPage);
	}

}
