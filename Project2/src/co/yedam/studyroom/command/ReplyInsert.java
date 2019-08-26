package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.CommentsDao;
import co.yedam.studyroom.dto.CommentsDto;


public class ReplyInsert implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CommentsDao dao = new CommentsDao();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String id = request.getParameter("id");
		String reply = request.getParameter("replycontent");
		int newCno = dao.getCommentsNo();
		
		CommentsDto comments = new CommentsDto();
		comments.setBno(bno);
		comments.setId(id);
		comments.setReply(reply);
		comments.setCno(newCno);
		
		if(dao.insertComments(comments)>0) {	//이번호를 다른데 쓸거임
			response.getWriter().print(newCno);	//새로등록된 cno날려줌
		};
		

	}

}
