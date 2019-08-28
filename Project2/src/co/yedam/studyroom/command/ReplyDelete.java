package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.CommentsDao;

public class ReplyDelete implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentsDao dao = new CommentsDao();
		
		int n = dao.deleteComment(cno);
		System.out.println(n);
		
	}

}
