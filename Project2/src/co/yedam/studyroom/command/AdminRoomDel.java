package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dao.StudyroomDao;

public class AdminRoomDel implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		StudyroomDao dao = new StudyroomDao();
		dao.deleteRoom(rnum);
		
		response.sendRedirect("Studyroom.do");
		
	}

}
