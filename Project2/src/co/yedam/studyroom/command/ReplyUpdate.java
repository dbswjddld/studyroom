package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.CommentsDao;
import co.yedam.studyroom.dto.CommentsDto;

public class ReplyUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		CommentsDto dto = new CommentsDto();
		CommentsDao dao = new CommentsDao();
		
		System.out.println(id);
		System.out.println(content);
		System.out.println(cno);
		
		dto.setCno(cno);
		dto.setReply(content);
		dto.setId(id);

		dao.updateComment(dto);
		
	}

}
