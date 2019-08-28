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

public class ReplyUpdateGet implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//cno 가져와서 
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		CommentsDao dao = new CommentsDao();
		List<Map<String, Object>> list = dao.newComments(cno);		//dto로 보내도될듯
		
		response.setContentType("text/html; charset=UTF-8");		//한글이포함된경우 반드ㅡ시넣어줘야 한글안깨진다
		response.getWriter().print(JSONArray.toJSONString(list));	//자바객체 json으로
		
		//dao.newComments(cno) 부름
		//setAtt
		
	}

}
