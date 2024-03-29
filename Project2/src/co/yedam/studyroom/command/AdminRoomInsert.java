package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.StudyroomDao;
import co.yedam.studyroom.dto.StudyroomDto;

public class AdminRoomInsert implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		StudyroomDao dao = new StudyroomDao();
		StudyroomDto dto = new StudyroomDto();
		
		int num = dao.getMaxNum();
		String rname = request.getParameter("rname");
		String rinfo = request.getParameter("rinfo");
		dto.setRnum(num);
		dto.setRname(rname);
		dto.setRinfo(rinfo);
		
		dao.insertRoom(dto);

		String viewPage = "Studyroom.do";
		
		response.sendRedirect(viewPage);
	}

}
