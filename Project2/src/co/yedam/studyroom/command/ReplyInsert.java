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
		int bno = Integer.parseInt(request.getParameter("bno"));
		String id = request.getParameter("id");
		String reply = request.getParameter("reply");
		
		CommentsDao dao = new CommentsDao();
		CommentsDto dto = new CommentsDto();
		dto.setBno(bno);
		List<Map<String, Object>> list = dao.commenstList(dto);
		
		response.setContentType("text/html; charset=UTF-8");		//한글이포함된경우 반드ㅡ시넣어줘야 한글안깨진다
		response.getWriter().print(JSONArray.toJSONString(list));	//자바객체 json으로
	

	}

}
