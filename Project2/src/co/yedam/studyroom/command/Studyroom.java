package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.StudyroomDao;
import co.yedam.studyroom.dto.StudyroomDto;

public class Studyroom implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		StudyroomDao dao = new StudyroomDao();
		ArrayList<StudyroomDto> list = new ArrayList<StudyroomDto>();
		
		list = dao.search();

		request.setAttribute("list", list);
		String viewPage ="jsp/adminRoom.jsp";
		HttpRes.forward(request, response, viewPage);
	}
}
