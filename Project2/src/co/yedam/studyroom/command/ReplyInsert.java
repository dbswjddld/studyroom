package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

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
		
		int check = dao.insertComments(comments);
		
		int cno = comments.getCno();
		if(check > 0) {
			List<Map<String, Object>> list = dao.newComments(cno);
			response.setContentType("text/html; charset=UTF-8");		//한글이포함된경우 반드ㅡ시넣어줘야 한글안깨진다
			response.getWriter().print(JSONArray.toJSONString(list));	//자바객체 json으로
		}
	}

}
