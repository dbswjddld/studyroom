package co.yedam.studyroom.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationPage2 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		String rname = request.getParameter("rname");
		//Date usedate = request.getParameter("usedate");
		ReservationDto dto = new ReservationDto();
		dto.setRname(rname);
		dto.setRnum(rnum);
		//dto.setUsedate(usedate);
		request.setAttribute("dto", dto);
		
		String viewPage = "jsp/reservation2.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
