package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.ReservationDao;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationContentsAdmin implements Command {
	// [윤정 20190820] 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ReservationDto dto = new ReservationDto();
		ReservationDao dao = new ReservationDao();
		int rno = Integer.valueOf(request.getParameter("rno"));
		dto = dao.contents(rno);
		
		request.setAttribute("dto", dto);
		
		String viewPage = "jsp/admin_reservationContents.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
