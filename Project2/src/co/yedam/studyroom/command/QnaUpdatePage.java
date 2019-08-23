package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dto.BoardDto;

public class QnaUpdatePage implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		BoardDto dto = new BoardDto();
		
		String content = request.getParameter("content");
		String subject = request.getParameter("subject");
		String id = request.getParameter("id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		dto.setBno(bno);
		dto.setContent(content);
		dto.setSubject(subject);
		dto.setId(id);
		
		request.setAttribute("dto", dto);
		String viewPage = "jsp/qnaupdatepage.jsp";
		HttpRes.forward(request, response, viewPage);
		
		
	}

}
