package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.BoardDao;
import co.yedam.studyroom.dto.BoardDto;

public class QnaUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao dao = new BoardDao();
		BoardDto dto = new BoardDto();
		dto.setBno(bno);
		dto.setSubject(subject);
		dto.setContent(content);
		dao.boardUpdate(dto);
		
		response.sendRedirect("Qna.do");
//		String viewPage = "Qna.do";
//		HttpRes.forward(request, response, viewPage);
		
	}

}
