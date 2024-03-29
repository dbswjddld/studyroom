package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.StudyroomDao;
import co.yedam.studyroom.dto.StudyroomDto;

public class AdminRoomEditPage implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		StudyroomDao dao = new StudyroomDao();
		StudyroomDto dto = new StudyroomDto();
		
		dto = dao.getRoom(rnum);
		request.setAttribute("dto", dto);
		String viewPage = "jsp/adminRoomEdit.jsp";
		
		HttpRes.forward(request, response, viewPage);
		
	}

}
